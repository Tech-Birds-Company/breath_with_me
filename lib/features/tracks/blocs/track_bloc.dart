import 'package:breathe_with_me/features/tracks/models/track.dart';
import 'package:breathe_with_me/managers/download_manager/track_download_task.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/managers/premium_manager/premium_manager.dart';
import 'package:breathe_with_me/managers/user_manager/user_manager.dart';
import 'package:breathe_with_me/repositories/tracks_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class TrackBloc extends BlocBase<Object?> {
  final Track _track;
  final TracksRepository _tracksRepository;
  final UserManager _userManager;
  final PremiumManager _premiumManager;
  final NavigationManager _navigationManager;

  Stream<bool> get trackIsLockedStream => _premiumManager.isPremiumUserStream
      .map((isUserPremium) => !isUserPremium && _track.isPremium)
      .distinct();

  TrackBloc(
    this._track,
    this._tracksRepository,
    this._userManager,
    this._premiumManager,
    this._navigationManager,
  ) : super(null);

  Stream<bool> get trackIsDownloadedStream {
    final userId = _userManager.currentUser!.uid;
    final task = TrackDownloadTask(
      trackId: _track.id,
      userId: userId,
      url: '',
    );
    return _tracksRepository.getTrackIsDownloadedStream(
      taskId: task.taskId,
    );
  }

  Stream<bool> get trackLikedStream => _tracksRepository.likedTracksStream
      .map(
        (likedTracks) => likedTracks.contains(_track.id),
      )
      .distinct();

  Future<void> onTrackTap() async {
    if (_track.isPremium && !_premiumManager.isUserPremium) {
      await _navigationManager.openPremiumPaywall();
    } else {
      await _navigationManager.openTrackPlayer(_track);
    }
  }

  Future<void> onTrackLiked() => _tracksRepository.updateLikes(_track.id);
}
