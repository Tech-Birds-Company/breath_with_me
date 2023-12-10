import 'package:breathe_with_me/features/practices/models/track.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/repositories/tracks_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class PracticeBloc extends BlocBase<Object?> {
  final String _trackId;
  final TracksRepository _tracksRepository;
  final NavigationManager _navigationManager;

  PracticeBloc(
    this._trackId,
    this._tracksRepository,
    this._navigationManager,
  ) : super(null);

  Stream<bool> trackIsDownloadedStream(String trackId) =>
      _tracksRepository.getTrackIsDownloadedStream(trackId);

  Stream<bool> trackLikedStream(String trackId) =>
      _tracksRepository.likedTracksStream
          .map(
            (likedTracks) => likedTracks.contains(trackId),
          )
          .distinct();

  void openTrackPlayer(Track track) => _navigationManager.openTrackPlayer(
        track.id,
        track: track,
      );

  Future<void> onTrackLiked() => _tracksRepository.updateLikes(_trackId);
}
