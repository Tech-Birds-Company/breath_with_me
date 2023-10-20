import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:breathe_with_me/features/practices/repositories/tracks_repository.dart';
import 'package:breathe_with_me/features/track_player/models/track_player_state.dart';
import 'package:breathe_with_me/features/track_player/player_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class TrackPlayerCubit extends Cubit<TrackPlayerState> {
  final String _trackId;
  final TracksRepository _tracksRepository;
  final PlayerManager _playerManager;

  TrackPlayerCubit(
    this._trackId,
    this._playerManager,
    this._tracksRepository,
  ) : super(const TrackPlayerState());

  StreamSubscription<double>? _progressSub;

  Future<void> init() async {
    final track = await _tracksRepository.getTrack(_trackId);
    final trackUrl = await _tracksRepository.getTrackDownloadUrl(track);

    await _playerManager.init(UrlSource(trackUrl));
    await _playerManager.play();

    _progressSub ??= _playerManager.progressStream?.listen((progress) {
      emit(state.copyWith(progress: progress));
    });

    emit(state.copyWith(isPaused: false));
  }

  Future<void> onTogglePlay() async {
    final isPaused = !state.isPaused;
    if (isPaused) {
      await _playerManager.pause();
    } else {
      await _playerManager.play();
    }
    emit(state.copyWith(isPaused: isPaused));
  }

  void dispose() {
    _playerManager.dispose();
    _progressSub?.cancel();
    _progressSub = null;
  }
}
