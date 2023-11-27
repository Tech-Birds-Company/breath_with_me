import 'package:audio_service/audio_service.dart';
import 'package:breathe_with_me/constants.dart';
import 'package:breathe_with_me/managers/audio_manager/audio_manager.dart';
import 'package:breathe_with_me/managers/player_manager/player_manager.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';

final class TrackAudioManager extends AudioManager {
  final PlayerManager _playerManager;

  TrackAudioManager(this._playerManager);

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
    await _playerManager.init(source);

    final audioPlayer = _playerManager.audioPlayer;
    final duration = audioPlayer!.duration;

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
      final estimatedMs = duration!.inMilliseconds - currentMs;
      final progress = currentMs / duration.inMilliseconds;

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

      return (currentMs, progress, estimatedMs);
    }).startWith((0, 0, 0));

    onPlayerStateChanged ??= audioPlayer.playerStateStream.map((state) {
      if (!state.playing) {
        playbackState.add(
          playbackState.value.copyWith(
            playing: false,
          ),
        );
      } else {
        playbackState.add(
          playbackState.value.copyWith(
            playing: true,
          ),
        );
      }

      return state;
    });
  }

  @override
  Future<void> play() => _playerManager.play();

  @override
  Future<void> pause() => _playerManager.pause();

  @override
  Future<void> stop() async {
    await _playerManager.stop();
    await super.stop();
  }

  @override
  void dispose() {
    playbackState.add(PlaybackState());
    _playerManager.dispose();
    progressStream = null;
    onPlayerStateChanged = null;
  }
}
