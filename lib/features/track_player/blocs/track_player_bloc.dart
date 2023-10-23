import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:breathe_with_me/features/track_player/models/track_player_state.dart';
import 'package:breathe_with_me/features/track_player/player_manager.dart';
import 'package:breathe_with_me/managers/download_manager/downloader_manager.dart';
import 'package:breathe_with_me/managers/download_manager/track_download_task.dart';
import 'package:breathe_with_me/repositories/tracks_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class TrackPlayerBloc extends BlocBase<TrackPlayerState> {
  final String _trackId;
  final TracksRepository _tracksRepository;
  final PlayerManager _playerManager;
  final DownloaderManager _downloaderManager;

  TrackPlayerBloc(
    this._trackId,
    this._tracksRepository,
    this._playerManager,
    this._downloaderManager,
  ) : super(TrackPlayerState.initialState);

  StreamSubscription<PlayerState>? _playerStateSub;
  StreamSubscription<double>? _playerProgressSub;
  StreamSubscription<double>? _downloadProgressSub;
  Stream<double>? _downloadProgressStream;

  Future<void> init() async {
    final trackDownloadTask =
        await _tracksRepository.getTrackDownloadTask(_trackId);

    final canPlayOffline = trackDownloadTask?.isCompleted ?? false;

    if (canPlayOffline) {
      await _handleOfflinePlay(trackDownloadTask!.filePath);
    } else {
      await _handleOnlinePlay();
    }
  }

  Future<void> _handleOfflinePlay(String trackFilePath) async {
    final localTrackFile = File(trackFilePath);
    if (localTrackFile.existsSync()) {
      await _initPlayerWithLocalFile(localTrackFile);
    } else {
      await _tracksRepository.deleteTrackDownloadTask(_trackId);
      await _handleOnlinePlay();
    }
  }

  Future<void> _handleOnlinePlay() async {
    final track = await _tracksRepository.getTrack(_trackId);
    final trackDownloadUrl = await _tracksRepository.getTrackDownloadUrl(track);
    await _initPlayerWithUrl(trackDownloadUrl);
    _queueTrackDownload(trackDownloadUrl);
  }

  Future<void> _initPlayerWithLocalFile(File localFile) async {
    await _playerManager.init(DeviceFileSource(localFile.path));
    _initSubscriptions();
    await _playerManager.play();
  }

  Future<void> _initPlayerWithUrl(String url) async {
    await _playerManager.init(UrlSource(url));
    _initSubscriptions();
    await _playerManager.play();
  }

  void _initSubscriptions() {
    _subscribeToPlayerState();
    _subscribeToPlayerProgress();
    _subscribeToDownloadProgress(_trackId);
  }

  void _queueTrackDownload(String url) {
    final downloadTask = TrackDownloadTask(
      id: _trackId,
      url: url,
    );

    _downloaderManager.queue(tasks: [downloadTask]);
  }

  void _subscribeToPlayerState() {
    _playerStateSub ??=
        _playerManager.audioPlayer?.onPlayerStateChanged.listen((playerState) {
      switch (playerState) {
        case PlayerState.playing:
          emit(state.copyWith(isPaused: false));
        case PlayerState.paused:
          emit(state.copyWith(isPaused: true));
        case PlayerState.stopped:
          break;
        case PlayerState.completed:
          break;
        case PlayerState.disposed:
          break;
      }
    });
  }

  void _subscribeToPlayerProgress() {
    _playerProgressSub ??= _playerManager.progressStream?.listen((progress) {
      emit(state.copyWith(progress: progress));
    });
  }

  void _subscribeToDownloadProgress(String taskId) {
    _downloadProgressStream ??= _downloaderManager.taskProgress(taskId);
    _downloadProgressSub ??= _downloadProgressStream?.listen(
      (progress) => emit(state.copyWith(downloadProgress: progress)),
    );
  }

  Future<void> onTogglePlay() async {
    final isPaused = !state.isPaused;
    if (isPaused) {
      await _playerManager.pause();
    } else {
      await _playerManager.play();
    }
  }

  void _cancelSubscriptions() {
    _playerStateSub?.cancel();
    _playerStateSub = null;

    _downloadProgressSub?.cancel();
    _downloadProgressSub = null;

    _playerProgressSub?.cancel();
    _playerProgressSub = null;

    _downloadProgressStream = null;
  }

  void dispose() {
    _cancelSubscriptions();
    _playerManager.dispose();
    emit(TrackPlayerState.initialState);
  }
}
