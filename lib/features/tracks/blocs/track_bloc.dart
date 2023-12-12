import 'package:breathe_with_me/features/tracks/models/track.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/repositories/tracks_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class TrackBloc extends BlocBase<Object?> {
  final Track _track;
  final TracksRepository _tracksRepository;
  final NavigationManager _navigationManager;

  TrackBloc(
    this._track,
    this._tracksRepository,
    this._navigationManager,
  ) : super(null);

  Stream<bool> trackIsDownloadedStream() =>
      _tracksRepository.getTrackIsDownloadedStream(_track.id);

  Stream<bool> trackLikedStream() => _tracksRepository.likedTracksStream
      .map(
        (likedTracks) => likedTracks.contains(_track.id),
      )
      .distinct();

  void openTrackPlayer() => _navigationManager.openTrackPlayer(
        _track.id,
        track: _track,
      );

  Future<void> onTrackLiked() => _tracksRepository.updateLikes(_track.id);
}
