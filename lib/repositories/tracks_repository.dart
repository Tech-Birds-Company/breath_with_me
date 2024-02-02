import 'package:breathe_with_me/database/schemas/download_track_task_schema.dart';
import 'package:breathe_with_me/features/tracks/models/track.dart';

abstract interface class TracksRepository {
  Future<void> cacheLikedTracks(List<String> likedTracks);

  Future<List<Track>> getTracks();

  Future<DownloadTrackTask?> getTrackDownloadTask({required String taskId});

  Future<String> getTrackDownloadUrl(Track track);

  Stream<bool> getTrackIsDownloadedStream({required String taskId});

  Future<void> deleteTrackDownloadTask({required String taskId});

  Future<void> updateLikes(String trackId);

  Stream<Set<String>> get likedTracksStream;

  Stream<Set<String>> get firebaseLikedTracksStream;

  Stream<List<Track>> get cachedTracksStream;
}
