import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:breathe_with_me/database/entities/download_track_task_entity.dart';
import 'package:breathe_with_me/features/track_player/models/track_player_state.dart';
import 'package:breathe_with_me/managers/audio_manager/audio_manager.dart';
import 'package:breathe_with_me/managers/download_manager/downloader_manager.dart';
import 'package:breathe_with_me/managers/download_manager/track_download_task.dart';
import 'package:breathe_with_me/repositories/tracks_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class TrackPlayerBloc extends BlocBase<TrackPlayerState> {
  final String _trackId;
  final TracksRepository _tracksRepository;
  final AudioManager _audioManager;
  final DownloaderManager _downloaderManager;

  TrackPlayerBloc(
    this._trackId,
    this._tracksRepository,
    this._audioManager,
    this._downloaderManager,
  ) : super(TrackPlayerState.initialState);

  StreamSubscription<PlayerState>? _playerStateSub;
  StreamSubscription<(int?, double, int?)>? _playerProgressSub;
  StreamSubscription<double>? _downloadProgressSub;
  Stream<double>? _downloadProgressStream;

  Future<void> init() async {
    final trackDownloadTask =
        await _tracksRepository.getTrackDownloadTask(_trackId);

    final canPlayOffline = trackDownloadTask?.isCompleted ?? false;

    if (canPlayOffline) {
      await _handleOfflinePlay(trackDownloadTask!);
    } else {
      await _handleOnlinePlay();
    }
  }

  Future<void> _handleOfflinePlay(DownloadTrackTaskEntity task) async {
    final localTrackFile = File(task.filePath);
    if (localTrackFile.existsSync()) {
      await _initPlayerWithLocalFile(
        localFile: localTrackFile,
        title: task.trackName,
        tutorNameKey: task.tutorNameKey,
      );
    } else {
      await _tracksRepository.deleteTrackDownloadTask(_trackId);
      await _handleOnlinePlay();
    }
  }

  Future<void> _handleOnlinePlay() async {
    final track = await _tracksRepository.getTrack(_trackId);
    final trackDownloadUrl = await _tracksRepository.getTrackDownloadUrl(track);
    await _initPlayerWithUrl(
      url: trackDownloadUrl,
      title: track.title,
      tutorNameKey: track.tutor.tutorNameKey,
    );
    _queueTrackDownload(
      url: trackDownloadUrl,
      trackName: track.title,
      tutorNameKey: track.tutor.tutorNameKey,
    );
  }

  Future<void> _initPlayerWithLocalFile({
    required File localFile,
    required String title,
    required String tutorNameKey,
  }) async {
    await _audioManager.init(
      DeviceFileSource(localFile.path),
      title: title,
      artist: tutorNameKey.tr(),
    );
    _initSubscriptions();
    await _audioManager.play();
  }

  Future<void> _initPlayerWithUrl({
    required String url,
    required String title,
    required String tutorNameKey,
  }) async {
    await _audioManager.init(
      UrlSource(url),
      title: title,
      artist: tutorNameKey.tr(),
    );
    _initSubscriptions();
    await _audioManager.play();
  }

  void _initSubscriptions() {
    _subscribeToPlayerState();
    _subscribeToPlayerProgress();
    _subscribeToDownloadProgress(_trackId);
  }

  void _queueTrackDownload({
    required String url,
    required String tutorNameKey,
    required String trackName,
  }) {
    final downloadTask = TrackDownloadTask(
      id: _trackId,
      url: url,
      tutorNameKey: tutorNameKey,
      trackName: trackName,
    );

    _downloaderManager.queue(tasks: [downloadTask]);
  }

  void _subscribeToPlayerState() {
    _playerStateSub ??=
        _audioManager.onPlayerStateChanged?.listen((playerState) {
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
    _playerProgressSub ??= _audioManager.progressStream?.listen((event) {
      final (currentTimeMs, progress, estimatedMs) = event;

      emit(
        state.copyWith(
          currentTimeMs: currentTimeMs,
          progress: progress,
          estimatedTimeMs: estimatedMs,
        ),
      );
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
      await _audioManager.pause();
    } else {
      await _audioManager.play();
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
    _audioManager.dispose();
    emit(TrackPlayerState.initialState);
  }
}
