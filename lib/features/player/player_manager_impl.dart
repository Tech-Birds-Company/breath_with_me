import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:breathe_with_me/features/player/player_manager.dart';
import 'package:rxdart/rxdart.dart';

class PlayerManagerImpl implements PlayerManager {
  PlayerManagerImpl();

  AudioPlayer? _audioPlayer;

  late final progressStream = _audioPlayer != null
      ? Rx.combineLatest2(
          _audioPlayer!.onDurationChanged,
          _audioPlayer!.onPositionChanged,
          (totalDuration, currentDuration) =>
              currentDuration.inMilliseconds / totalDuration.inMilliseconds,
        ).startWith(0.0)
      : null;

  @override
  Future<void> init() async {
    _audioPlayer ??= AudioPlayer();
    await _audioPlayer?.setSource(
      AssetSource('audio/test.mp3'),
    );
  }

  @override
  Future<void> pause() async {
    await _audioPlayer?.pause();
  }

  @override
  Future<void> play() async {
    if (_audioPlayer != null) {
      await _audioPlayer!.play(_audioPlayer!.source!);
    }
  }

  @override
  Future<void> dispose() async {
    await _audioPlayer?.dispose();
    _audioPlayer = null;
  }
}
