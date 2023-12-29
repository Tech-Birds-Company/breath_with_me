import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:breathe_with_me/database/schemas/download_track_task_schema.dart';
import 'package:breathe_with_me/features/track_player/models/track_player_state.dart';
import 'package:breathe_with_me/features/tracks/models/track.dart';
import 'package:breathe_with_me/managers/audio_manager/audio_manager.dart';
import 'package:breathe_with_me/managers/download_manager/downloader_manager.dart';
import 'package:breathe_with_me/managers/download_manager/track_download_task.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/managers/user_manager/user_manager.dart';
import 'package:breathe_with_me/repositories/tracks_repository.dart';
import 'package:breathe_with_me/utils/string_hex_to_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

final class TrackPlayerBloc extends BlocBase<TrackPlayerState> {
  final Track _track;
  final TracksRepository _tracksRepository;
  final UserManager _userManager;
  final AudioManager _audioManager;
  final DownloaderManager _downloaderManager;
  final NavigationManager _navigationManager;

  TrackPlayerBloc(
    this._track,
    this._tracksRepository,
    this._userManager,
    this._audioManager,
    this._downloaderManager,
    this._navigationManager,
  ) : super(TrackPlayerState.initialState);

  Color? get animationColor => _track.animationColor.toColor;
  StreamSubscription<PlayerState>? _playerStateSub;
  StreamSubscription<(int?, double, int?)>? _playerProgressSub;
  StreamSubscription<double>? _downloadProgressSub;
  Stream<double>? _downloadProgressStream;

  void _initSubscriptions() {
    _subscribeToPlayerState();
    _subscribeToPlayerProgress();
    _subscribeToDownloadProgress(_track.id);
  }

  Future<void> init() async {
    final trackDownloadTask =
        await _tracksRepository.getTrackDownloadTask(_track.id);

    final canPlayOffline = trackDownloadTask?.isCompleted ?? false;

    if (canPlayOffline) {
      await _handleOfflinePlay(trackDownloadTask!);
    } else {
      await _handleOnlinePlay();
    }
  }

  void onFinishTap() {
    _audioManager.stop();
    _navigationManager.openStreak(_track);
  }

  Future<void> _handleOfflinePlay(DownloadTrackTask task) async {
    final trackPath = await _downloaderManager.getTrackPath(
      uid: task.uid,
      taskId: task.taskId,
      filename: task.filename,
    );
    final localTrackFile = File(trackPath);

    if (localTrackFile.existsSync()) {
      await _initPlayerWithLocalFile(localFile: localTrackFile);
    } else {
      await _tracksRepository.deleteTrackDownloadTask(_track.id);
      await _handleOnlinePlay();
    }
  }

  Future<void> _handleOnlinePlay() async {
    final track = await _tracksRepository.getTrack(_track.id);
    final trackDownloadUrl = await _tracksRepository.getTrackDownloadUrl(track);
    _queueTrackDownload(url: trackDownloadUrl);
    await _initPlayerWithUrl(
      url: trackDownloadUrl,
      categoryKey: track.categoryKey,
      tutorNameKey: track.tutor.tutorNameKey,
    );
  }

  Future<void> _initPlayerWithLocalFile({required File localFile}) async {
    await _audioManager.init(
      AudioSource.file(localFile.path),
      id: _track.id,
      title: _track.categoryKey.tr(),
      artist: _track.tutor.tutorNameKey.tr(),
    );
    _initSubscriptions();
    await _audioManager.play();
  }

  Future<void> _initPlayerWithUrl({
    required String url,
    required String categoryKey,
    required String tutorNameKey,
  }) async {
    await _audioManager.init(
      AudioSource.uri(Uri.parse(url)),
      id: _track.id,
      title: categoryKey.tr(),
      artist: tutorNameKey.tr(),
    );
    _initSubscriptions();
    await _audioManager.play();
  }

  void _queueTrackDownload({required String url}) {
    final uid = _userManager.currentUser?.uid;
    if (uid == null) return;

    final downloadTask = TrackDownloadTask(
      uid: _userManager.currentUser!.uid,
      id: _track.id,
      url: url,
    );
    _downloaderManager.queue(tasks: [downloadTask]);
  }

  void _subscribeToPlayerState() {
    _playerStateSub ??= _audioManager.onPlayerStateChanged?.listen(
      (playerState) => emit(
        state.copyWith(isPaused: !playerState.playing),
      ),
    );
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
    _downloadProgressStream ??= _downloaderManager.taskProgress(taskId: taskId);
    _downloadProgressSub ??= _downloadProgressStream?.listen(
      (progress) {
        emit(state.copyWith(downloadProgress: progress));
      },
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
  }
}
