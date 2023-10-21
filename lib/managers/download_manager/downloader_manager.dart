import 'package:breathe_with_me/managers/download_manager/download_task.dart';

base class DownloaderManager {
  Stream<double>? taskProgress(String taskId) {
    return const Stream.empty();
  }

  void queue({required List<DownloadTask> tasks}) {}
}
