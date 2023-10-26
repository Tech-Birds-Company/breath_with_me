import 'package:breathe_with_me/managers/download_manager/download_task.dart';

final class TrackDownloadTask extends DownloadTask {
  final String tutorNameKey;
  final String trackName;

  const TrackDownloadTask({
    required super.id,
    required super.url,
    required this.tutorNameKey,
    required this.trackName,
  });
}
