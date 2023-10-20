import 'dart:async';
import 'dart:io';

import 'package:breathe_with_me/managers/download_manager/download_task.dart';
import 'package:breathe_with_me/managers/download_manager/downloader_manager.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

final class _QueueItem {
  final String id;
  final DownloadTask task;
  final CancelToken cancelToken;
  final StreamController<double> progressController;

  const _QueueItem({
    required this.id,
    required this.task,
    required this.cancelToken,
    required this.progressController,
  });
}

final class TracksDownloaderManager implements DownloaderManager {
  late final _queue = <String, _QueueItem>{};
  late final _httpClient = Dio();

  void _onTaskCompleted({required String id}) {
    final item = _queue[id];
    item?.progressController.close();
    _queue.remove(id);
  }

  Future<void> _queueTask({
    required String id,
    required DownloadTask task,
  }) async {
    final cancelToken = CancelToken();
    final progressController = StreamController<double>.broadcast();
    _queue[id] = _QueueItem(
      id: id,
      task: task,
      cancelToken: cancelToken,
      progressController: progressController,
    );

    final tmpDir = await getTemporaryDirectory();
    final path = '${tmpDir.path}/${task.savePath}';
    final folder = Directory(path);
    final folderExists = folder.existsSync();

    if (!folderExists) {
      await folder.create();
    }

    await _httpClient.download(
      task.url,
      '${tmpDir.path}/${task.savePath}/$id.${task.fileExtension}',
      cancelToken: cancelToken,
      onReceiveProgress: (count, total) {
        final progress = count / total;
        progressController.add(progress);
        if (progress == 1.0) {
          _onTaskCompleted(id: id);
        }
      },
    );
  }

  @override
  void queue({required List<DownloadTask> tasks}) {
    for (final task in tasks) {
      _queueTask(
        id: task.id,
        task: task,
      );
    }
  }

  @override
  Stream<double>? progress(String id) {
    final item = _queue[id];

    return item?.progressController.stream;
  }

  @override
  void cancel({required String id}) {
    final item = _queue[id];
    item?.cancelToken.cancel();
    item?.progressController.close();
    _queue.remove(id);
  }

  @override
  void cancelAll() {
    for (final item in _queue.values) {
      cancel(id: item.id);
    }
    _queue.clear();
  }

  @override
  void dispose() {
    cancelAll();
  }
}
