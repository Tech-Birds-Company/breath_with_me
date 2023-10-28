import 'dart:async';
import 'dart:io';

import 'package:breathe_with_me/database/entities/download_track_task_entity.dart';
import 'package:breathe_with_me/managers/database_manager/database_manager.dart';
import 'package:breathe_with_me/managers/download_manager/download_task.dart';
import 'package:breathe_with_me/managers/download_manager/downloader_manager.dart';
import 'package:breathe_with_me/managers/download_manager/track_download_task.dart';
import 'package:breathe_with_me/objectbox.g.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

final class TracksDownloaderManager implements DownloaderManager {
  static const defaultTracksPath = 'tracks';

  final DatabaseManager _databaseManager;

  TracksDownloaderManager(this._databaseManager);

  late final _httpClient = Dio();

  @override
  Future<void> validateDownloads() async {
    final box = _databaseManager.downloadTaskBox;
    final tasks = box.getAll();
    final tasksToDelete = <int>[];

    for (final task in tasks) {
      if (task.isCompleted) {
        final file = File(task.filePath);
        final fileNotExists = !file.existsSync();

        if (fileNotExists) {
          tasksToDelete.add(task.id);
          continue;
        }

        final fileCorrupted = file.lengthSync() != task.totalBytes;

        if (fileCorrupted) {
          await file.delete();
          tasksToDelete.add(task.id);
        }
      }
    }

    await box.removeManyAsync(tasksToDelete);
  }

  @override
  Stream<double> taskProgress(String taskId) {
    return _databaseManager.taskProgressStream(taskId);
  }

  Future<void> _downloadChunk({
    required DownloadTrackTaskEntity dbEntity,
    required String chunkFilePath,
    required int startBytesRange,
    required int endBytesRange,
  }) async {
    final response = await _httpClient.get<List<int>>(
      dbEntity.url,
      options: Options(
        headers: {
          'range': 'bytes=$startBytesRange-$endBytesRange',
        },
        responseType: ResponseType.bytes,
      ),
    );

    final length = response.data!.length;
    dbEntity.downloadedBytes += length;

    _databaseManager.downloadTaskBox.putQueued(
      dbEntity,
      mode: PutMode.update,
    );

    final chunkFile = File(chunkFilePath);
    final raf = chunkFile.openSync(mode: FileMode.write)
      ..writeFromSync(response.data!);

    await raf.close();
  }

  Future<int> _getFileSize(String url) async {
    final fileSizeResponse = await _httpClient.head<List<int>>(url);

    return int.parse(
      fileSizeResponse.headers.value(Headers.contentLengthHeader)!,
    );
  }

  Future<void> _mergeChunksToFile({
    required String filePath,
    required String chunkFilesPath,
    required int chunksCount,
  }) async {
    final trackFile = File(filePath);
    final raf = trackFile.openSync(mode: FileMode.write);

    for (var i = 0; i < chunksCount; i++) {
      final chunkFilePath = join(chunkFilesPath, 'chunk_$i');
      final chunkFile = File(chunkFilePath);

      if (chunkFile.existsSync()) {
        final rafChunk = chunkFile.openSync();
        raf.writeFromSync(rafChunk.readSync(rafChunk.lengthSync()));

        await rafChunk.close();
        await chunkFile.delete();
      }
    }

    await raf.close();
  }

  Future<void> _queueTask(
    DownloadTask task, {
    int chunksCount = 10,
  }) async {
    final cacheDir = await getApplicationCacheDirectory();
    final tracksCacheDirPath = join(cacheDir.path, defaultTracksPath);
    final savePath = join(tracksCacheDirPath, task.id);
    final saveDir = Directory(savePath);

    if (!saveDir.existsSync()) {
      await saveDir.create(recursive: true);
    }

    final fileExtension = extension(Uri.parse(task.url).path);
    final filename = '${task.id}$fileExtension';

    if (!saveDir.existsSync()) {
      await saveDir.create(recursive: true);
    }

    final fileSize = await _getFileSize(task.url);
    final chunkSize = (fileSize / chunksCount).ceil();

    final queue = <Future<void>>[];

    final dbEntity = await _databaseManager.createDownloadTrackTask(
      task: task,
      filePath: join(savePath, filename),
      totalBytes: fileSize,
    );

    for (var i = 0; i < chunksCount; i++) {
      final startBytesRange = i * chunkSize;
      var endBytesRange = (i + 1) * chunkSize - 1;
      if (endBytesRange >= fileSize) {
        endBytesRange = fileSize - 1;
      }

      final chunkFilePath = join(savePath, 'chunk_$i');
      final chunkFile = File(chunkFilePath);
      if (chunkFile.existsSync()) {
        continue;
      }

      queue.add(
        _downloadChunk(
          dbEntity: dbEntity,
          chunkFilePath: chunkFilePath,
          startBytesRange: startBytesRange,
          endBytesRange: endBytesRange,
        ),
      );
    }
    await Future.wait(queue);
    await _mergeChunksToFile(
      filePath: join(savePath, filename),
      chunkFilesPath: savePath,
      chunksCount: chunksCount,
    );
  }

  @override
  void queue({required List<DownloadTask> tasks}) {
    for (final task in tasks) {
      _queueTask(task as TrackDownloadTask);
    }
  }
}
