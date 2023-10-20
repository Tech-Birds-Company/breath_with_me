import 'package:breathe_with_me/managers/download_manager/download_task.dart';

abstract interface class DownloaderManager {
  void queue({required List<DownloadTask> tasks});
  void cancel({required String id});
  void cancelAll();
  void dispose();
  Stream<double>? progress(String id);
}
