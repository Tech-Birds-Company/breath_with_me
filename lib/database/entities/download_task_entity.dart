import 'package:objectbox/objectbox.dart';

@Entity()
class DownloadTaskEntity {
  @Id()
  int id = 0;

  String taskId;
  String url;
  String filePath;

  int downloadedBytes = 0;
  int? totalBytes;

  @Transient()
  bool get isCompleted {
    return downloadedBytes == totalBytes;
  }

  DownloadTaskEntity({
    required this.taskId,
    required this.url,
    required this.filePath,
    this.downloadedBytes = 0,
    this.totalBytes,
  });
}
