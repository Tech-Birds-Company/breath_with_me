import 'package:breathe_with_me/managers/download_manager/download_task.dart';

abstract interface class DownloaderManager {
  Stream<double> taskProgress(String taskId);
  void queue({required List<DownloadTask> tasks});
  Future<void> validateDownloads();
}
