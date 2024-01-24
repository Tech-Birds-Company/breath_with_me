import 'package:breathe_with_me/managers/download_manager/download_task.dart';

abstract interface class DownloaderManager {
  Stream<double> taskProgress({required DownloadTask task});

  void queue({required List<DownloadTask> tasks});

  Future<void> validateDownloads(String uid);

  Future<String> getTrackPath({
    required String taskId,
    required String filename,
  });

  Future<String> getTrackDirPath({required String taskId});
}
