import 'package:isar/isar.dart';

part 'download_track_task_schema.g.dart';

@collection
final class DownloadTrackTask {
  Id? id;
  @Index(unique: true, replace: true, type: IndexType.hash)
  String taskId;
  String uid;
  String url;
  String filename;
  int downloadedBytes = 0;
  int? totalBytes;

  @Ignore()
  bool get isCompleted {
    return downloadedBytes == totalBytes;
  }

  DownloadTrackTask({
    required this.uid,
    required this.taskId,
    required this.url,
    required this.filename,
    this.downloadedBytes = 0,
    this.totalBytes,
  });
}
