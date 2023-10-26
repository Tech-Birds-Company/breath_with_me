import 'package:breathe_with_me/database/entities/download_track_task_entity.dart';
import 'package:breathe_with_me/features/practices/models/track.dart';

abstract interface class TracksRepository {
  Future<Track> getTrack(String trackId);
  Future<List<Track>> getTracks();
  Future<DownloadTrackTaskEntity?> getTrackDownloadTask(String trackId);
  Future<String> getTrackDownloadUrl(Track track);
  Stream<bool> getTrackIsDownloadedStream(String trackId);
  Future<void> deleteTrackDownloadTask(String taskId);
}
