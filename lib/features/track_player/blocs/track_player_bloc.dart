import 'dart:async';
import 'dart:io';

import 'package:async/async.dart';
import 'package:breathe_with_me/database/schemas/download_track_task_schema.dart';
import 'package:breathe_with_me/features/track_player/models/track_player_state.dart';
import 'package:breathe_with_me/features/tracks/models/track.dart';
import 'package:breathe_with_me/managers/audio_manager/audio_manager.dart';
import 'package:breathe_with_me/managers/download_manager/downloader_manager.dart';
import 'package:breathe_with_me/managers/download_manager/track_download_task.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/managers/streak_progress_manager/streak_progress_manager.dart';
import 'package:breathe_with_me/managers/user_manager/user_manager.dart';
import 'package:breathe_with_me/repositories/tracks_repository.dart';
import 'package:breathe_with_me/utils/analytics/bwm_analytics.dart';
import 'package:breathe_with_me/utils/logger.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

final class TrackPlayerBloc extends BlocBase<TrackPlayerState> {
  final Track _track;
  final AudioManager _audioManager;
  final TracksRepository _tracksRepository;
  final UserManager _userManager;
  final DownloaderManager _downloaderManager;
  final StreakProgressManager _streakProgressManager;
  final NavigationManager _navigationManager;

  TrackPlayerBloc(
    this._track,
    this._audioManager,
    this._tracksRepository,
    this._userManager,
    this._downloaderManager,
    this._streakProgressManager,
    this._navigationManager,
  ) : super(TrackPlayerState.initialState);

  Track get track => _track;
  StreamSubscription<PlayerState>? _playerStateSub;
  StreamSubscription<(int?, int)>? _playerProgressSub;
  StreamSubscription<double>? _downloadProgressSub;
  Stream<double>? _downloadProgressStream;

  CancelableOperation<String>? _getTrackDownloadUrlOperation;

  void _initPlayerSubscriptions() {
    _subscribeToPlayerState();
    _subscribeToPlayerProgress();
  }

  void _initDownloadProgressSubscription(TrackDownloadTask task) {
    _downloadProgressStream ??= _downloaderManager.taskProgress(task: task);
    _downloadProgressSub ??= _downloadProgressStream?.listen(
      (progress) {
        emit(state.copyWith(downloadProgress: progress));
      },
    );
  }

  Future<void> init() async {
    await WakelockPlus.toggle(enable: true);
    logger.i('Wakelock enabled');
    final userId = _userManager.currentUser!.uid;
    final task = TrackDownloadTask(
      trackId: track.id,
      userId: userId,
      url: '',
    );
    final trackDownloadTask = await _tracksRepository.getTrackDownloadTask(
      taskId: task.taskId,
    );

    final canPlayOffline = trackDownloadTask?.isCompleted ?? false;

    if (canPlayOffline) {
      BWMAnalytics.event('initOfflineTrack', params: {'trackId': track.id});
      await _handleOfflinePlay(trackDownloadTask!);
    } else {
      BWMAnalytics.event('initOnlineTrack', params: {'trackId': track.id});
      await _handleOnlinePlay();
    }
  }

  Future<void> _handleOfflinePlay(DownloadTrackTask task) async {
    final trackPath = await _downloaderManager.getTrackPath(
      taskId: task.taskId,
      filename: task.filename,
    );
    final localTrackFile = File(trackPath);

    if (localTrackFile.existsSync()) {
      await _initPlayerWithLocalFile(localFile: localTrackFile);
    } else {
      await _tracksRepository.deleteTrackDownloadTask(taskId: task.taskId);
      await _handleOnlinePlay();
    }
  }

  Future<void> _handleOnlinePlay() async {
    final context = _navigationManager.context;
    if (context == null) return;
    final language = EasyLocalization.of(context)?.locale.languageCode;
    if (language == null) return;

    _getTrackDownloadUrlOperation ??= CancelableOperation.fromFuture(
      _tracksRepository.getTrackDownloadUrl(track),
    );
    final trackDownloadUrl = await _getTrackDownloadUrlOperation!.value;
    _queueTrackDownload(url: trackDownloadUrl);
    await _initPlayerWithUrl(
      url: trackDownloadUrl,
      categoryKey: track.categoryKey,
      tutorName: _track.tutor.tutorNameTranslations?[language] ??
          track.tutor.tutorNameKey.tr(),
    );
  }

  Future<void> _initPlayerWithLocalFile({required File localFile}) async {
    final context = _navigationManager.context;
    if (context == null) return;
    final language = EasyLocalization.of(context)?.locale.languageCode;
    if (language == null) return;

    await _audioManager.init(
      AudioSource.file(localFile.path),
      id: _track.id,
      title: _track.categoryKey.tr(),
      artist: _track.tutor.tutorNameTranslations?[language] ??
          track.tutor.tutorNameKey.tr(),
    );
    _initPlayerSubscriptions();

    final userId = _userManager.currentUser!.uid;

    _initDownloadProgressSubscription(
      TrackDownloadTask(
        trackId: _track.id,
        userId: userId,
        url: '',
      ),
    );
    await _audioManager.play();
  }

  Future<void> _initPlayerWithUrl({
    required String url,
    required String categoryKey,
    required String tutorName,
  }) async {
    await _audioManager.init(
      AudioSource.uri(Uri.parse(url)),
      id: _track.id,
      title: categoryKey.tr(),
      artist: tutorName,
    );
    _initPlayerSubscriptions();

    final userId = _userManager.currentUser!.uid;
    _initDownloadProgressSubscription(
      TrackDownloadTask(
        trackId: _track.id,
        userId: userId,
        url: url,
      ),
    );
    await _audioManager.play();
  }

  void _queueTrackDownload({required String url}) {
    final uid = _userManager.currentUser?.uid;
    if (uid == null) return;

    final downloadTask = TrackDownloadTask(
      trackId: _track.id,
      userId: _userManager.currentUser!.uid,
      url: url,
    );
    _downloaderManager.queue(tasks: [downloadTask]);
  }

  Future<void> onSeekTrack(double percent) async {
    final position = _audioManager.playbackState.valueOrNull?.position;
    if (position == null) {
      return;
    }
    await _audioManager.seekTrack(percent);
  }

  Future<void> onTrackFinish() async {
    BWMAnalytics.event('onTrackFinish', params: {'trackId': track.id});

    unawaited(
      _streakProgressManager.addStreakData(
        minutes: track.duration,
        date: DateTime.now(),
      ),
    );
    _navigationManager.pop();
    await _navigationManager.openStreak(_track);
  }

  void _subscribeToPlayerState() =>
      _playerStateSub ??= _audioManager.onPlayerStateChanged?.listen(
        (playerState) {
          emit(state.copyWith(isPaused: !playerState.playing));
          if (playerState.processingState == ProcessingState.completed) {
            onTrackFinish();
          }
        },
      );

  void _subscribeToPlayerProgress() =>
      _playerProgressSub ??= _audioManager.progressStream?.listen(
        (event) {
          final (currentMs, totalMs) = event;
          emit(
            state.copyWith(
              currentTimeMs: currentMs,
              totalMs: totalMs,
            ),
          );
        },
      );

  Future<void> onTogglePlay() async {
    final isPaused = !state.isPaused;
    if (isPaused) {
      await _audioManager.pause();
    } else {
      await _audioManager.play();
    }
  }

  Future<void> _cancelSubscriptions() async {
    await _playerStateSub?.cancel();
    await _downloadProgressSub?.cancel();
    await _playerProgressSub?.cancel();
    _playerStateSub = null;
    _downloadProgressSub = null;
    _playerProgressSub = null;
    _downloadProgressStream = null;
  }

  Future<void> dispose() async {
    await _getTrackDownloadUrlOperation?.cancel();
    _getTrackDownloadUrlOperation = null;
    await _cancelSubscriptions();
    await _audioManager.dispose();
    await WakelockPlus.toggle(enable: false);
    logger.i('Wakelock disabled');
  }
}
