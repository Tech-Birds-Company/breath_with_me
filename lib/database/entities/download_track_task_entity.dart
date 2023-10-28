import 'package:objectbox/objectbox.dart';

@Entity()
class DownloadTrackTaskEntity {
  @Id()
  int id = 0;

  String taskId;
  String url;
  String filePath;
  String tutorNameKey;
  String trackName;

  int downloadedBytes = 0;
  int? totalBytes;

  @Transient()
  bool get isCompleted {
    return downloadedBytes == totalBytes;
  }

  DownloadTrackTaskEntity({
    required this.taskId,
    required this.url,
    required this.filePath,
    required this.tutorNameKey,
    required this.trackName,
    this.downloadedBytes = 0,
    this.totalBytes,
  });
}
