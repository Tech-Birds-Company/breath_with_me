import 'package:breathe_with_me/database/database.dart';
import 'package:breathe_with_me/database/entities/bloc_state_entity.dart';
import 'package:breathe_with_me/database/entities/download_track_task_entity.dart';
import 'package:breathe_with_me/managers/download_manager/download_task.dart';
import 'package:breathe_with_me/managers/download_manager/track_download_task.dart';
import 'package:breathe_with_me/objectbox.g.dart';

final class DatabaseManager {
  final BWMDatabase _database;

  DatabaseManager(this._database);

  late final _store = _database.store;
  late final downloadTaskBox = _store.box<DownloadTrackTaskEntity>();
  late final blocStateBox = _store.box<BlocStateEntity>();

  Future<DownloadTrackTaskEntity?> getDownloadTask(String taskId) async {
    return downloadTaskBox
        .query(DownloadTrackTaskEntity_.taskId.equals(taskId))
        .build()
        .findFirstAsync();
  }

  Future<DownloadTrackTaskEntity> createDownloadTrackTask({
    required DownloadTask task,
    required String filePath,
    required int totalBytes,
  }) async {
    final dbEntity = await getDownloadTask(task.id);
    final downloadTrackTask = task as TrackDownloadTask;

    if (dbEntity != null) {
      return dbEntity;
    }

    final entity = DownloadTrackTaskEntity(
      taskId: task.id,
      url: task.url,
      tutorNameKey: downloadTrackTask.tutorNameKey,
      trackName: downloadTrackTask.trackName,
      filePath: filePath,
      totalBytes: totalBytes,
    );

    return downloadTaskBox.putAndGetAsync(entity);
  }

  Future<void> deleteDownloadTask(String taskId) {
    return downloadTaskBox
        .query(DownloadTrackTaskEntity_.taskId.equals(taskId))
        .build()
        .removeAsync();
  }

  Stream<double> taskProgressStream(String taskId) {
    return downloadTaskBox
        .query(DownloadTrackTaskEntity_.taskId.equals(taskId))
        .watch(triggerImmediately: true)
        .map(
          (event) {
            final task = event.findFirst();
            if (task != null) {
              final downloadedBytes = task.downloadedBytes;
              final totalBytes = task.totalBytes ?? 0;
              if (totalBytes > 0) {
                return downloadedBytes / totalBytes;
              }
            }
            return 0.0;
          },
        )
        .asBroadcastStream()
        .distinct();
  }

  void dispose() {
    _store.close();
  }

  void clearDb() {
    downloadTaskBox.removeAll();
    blocStateBox.removeAll();
  }
}
