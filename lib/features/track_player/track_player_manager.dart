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
    progressStream = audioPlayer!.onPositionChanged
        .map((event) => event.inMilliseconds / duration!.inMilliseconds)
        .startWith(0);
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
