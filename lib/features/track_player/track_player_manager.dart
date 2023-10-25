import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:breathe_with_me/features/track_player/player_manager.dart';
import 'package:rxdart/rxdart.dart';

final class TrackPlayerManager extends PlayerManager {
  @override
  Future<void> init(Source source) async {
    audioPlayer ??= AudioPlayer();
    await audioPlayer!.setSource(source);
    final duration = await audioPlayer!.getDuration();
    progressStream = audioPlayer!.onPositionChanged.map((position) {
      final currentMs = position.inMilliseconds;
      final estimatedMs = duration!.inMilliseconds - currentMs;
      final progress = currentMs / duration.inMilliseconds;

      return (currentMs, progress, estimatedMs);
    }).startWith((0, 0, 0));
  }

  @override
  Future<void> play() async {
    final source = audioPlayer?.source;
    if (source != null) {
      await audioPlayer?.play(source);
    }
  }

  @override
  Future<void> pause() async {
    await audioPlayer?.pause();
  }
}
