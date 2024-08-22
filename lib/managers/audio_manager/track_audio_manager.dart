import 'package:audio_service/audio_service.dart';
import 'package:breathe_with_me/constants.dart';
import 'package:breathe_with_me/managers/audio_manager/audio_manager.dart';
import 'package:breathe_with_me/managers/player_manager/player_manager.dart';
import 'package:breathe_with_me/managers/player_manager/track_player_manager.dart';
import 'package:breathe_with_me/managers/user_manager/user_manager.dart';
import 'package:breathe_with_me/utils/analytics/bwm_analytics.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';

final class TrackAudioManager extends AudioManager {
  final UserManager _userManager;

  TrackAudioManager(this._userManager);

  PlayerManager? _playerManager;

  Future<Uri> _getArtUri() async {
    final appDocsDir = await getApplicationDocumentsDirectory();
    return Uri.parse(
      'file://${join(appDocsDir.path, BWMConstants.appIconFilename)}',
    );
  }

  @override
  Future<void> init(
    AudioSource source, {
    required String id,
    required String title,
    required String artist,
  }) async {
    _playerManager ??= TrackPlayerManager(_userManager);
    await _playerManager?.init(source);

    final audioPlayer = _playerManager?.audioPlayer;

    if (audioPlayer == null) {
      return;
    }

    final duration = audioPlayer.duration;

    if (duration == null) {
      return;
    }

    final playerMediaItem = MediaItem(
      id: id,
      title: title,
      artist: artist,
      duration: duration,
      artUri: await _getArtUri(),
    );

    mediaItem.add(playerMediaItem);

    progressStream ??= audioPlayer.positionStream.map((position) {
      final currentMs = position.inMilliseconds;

      playbackState.add(
        playbackState.value.copyWith(
          controls: [
            MediaControl.play,
            MediaControl.pause,
          ],
          processingState: AudioProcessingState.ready,
          updatePosition: position,
        ),
      );

      return (currentMs, duration.inMilliseconds);
    }).startWith((0, 0));

    onPlayerStateChanged ??= audioPlayer.playerStateStream.map(
      (state) {
        playbackState.add(
          playbackState.value.copyWith(
            playing: state.playing,
          ),
        );
        return state;
      },
    );
  }

  @override
  Future<void> play() async {
    BWMAnalytics.event(
      'onPlayTrack',
      params: {
        'trackId': mediaItem.valueOrNull?.id ?? 'null',
        'playback': playbackState.valueOrNull?.toString() ?? 'null',
      },
    );
    await _playerManager?.play();
  }

  @override
  Future<void> seekTrack(double percent) async {
    final audioPlayer = _playerManager?.audioPlayer;

    if (audioPlayer == null) {
      return;
    }

    final duration = audioPlayer.duration;

    if (duration == null) {
      return;
    }

    final seekPosition = (duration.inMilliseconds * percent).round();
    await audioPlayer.seek(Duration(milliseconds: seekPosition));
  }

  @override
  Future<void> pause() async {
    BWMAnalytics.event(
      'onPauseTrack',
      params: {
        'trackId': mediaItem.valueOrNull?.id ?? 'null',
        'playback': playbackState.valueOrNull?.toString() ?? 'null',
      },
    );
    await _playerManager?.pause();
  }

  @override
  Future<void> stop() async {
    await _playerManager?.stop();
    await super.stop();
    BWMAnalytics.event(
      'onAudioManagerStop',
      params: {
        'trackId': mediaItem.value?.id ?? 'null',
        'playback': playbackState.valueOrNull?.toString() ?? 'null',
      },
    );
  }

  @override
  Future<void> dispose() async {
    await stop();
    await _playerManager?.dispose();
    _playerManager = null;
    progressStream = null;
    onPlayerStateChanged = null;
  }
}
