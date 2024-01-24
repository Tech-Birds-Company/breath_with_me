import 'package:breathe_with_me/managers/download_manager/download_task.dart';

final class TrackDownloadTask extends DownloadTask {
  const TrackDownloadTask({
    required super.trackId,
    required super.userId,
    required super.url,
  });
}
