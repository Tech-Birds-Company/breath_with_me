import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:breathe_with_me/managers/player_manager/player_manager.dart';

final class TrackPlayerManager extends PlayerManager {
  @override
  Future<void> init(Source source) async {
    audioPlayer ??= AudioPlayer();
    await audioPlayer!.setSource(source);
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

  @override
  Future<void> stop() async {
    await audioPlayer?.stop();
  }
}
