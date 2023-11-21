import 'package:audio_service/audio_service.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:breathe_with_me/constants.dart';
import 'package:breathe_with_me/managers/audio_manager/audio_manager.dart';
import 'package:breathe_with_me/managers/player_manager/player_manager.dart';
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
    Source source, {
    required String title,
    required String artist,
  }) async {
    await _playerManager.init(source);

    final audioPlayer = _playerManager.audioPlayer;
    final duration = await audioPlayer!.getDuration();

    final playerMediaItem = MediaItem(
      id: _playerManager.audioPlayer!.playerId,
      title: title,
      artist: artist,
      duration: duration,
      artUri: await _getArtUri(),
    );

    mediaItem.add(playerMediaItem);

    progressStream ??= audioPlayer.onPositionChanged.map((position) {
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

    onPlayerStateChanged ??= audioPlayer.onPlayerStateChanged.map((state) {
      if (state != PlayerState.playing) {
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
