import 'dart:async';

import 'package:audioplayers/audioplayers.dart';

abstract base class PlayerManager {
  AudioPlayer? audioPlayer;
  Stream<(int?, double, int?)>? progressStream;

  /// Should be called before [play] or [pause]
  Future<void> init(Source source);

  Future<void> play();

  Future<void> pause();

  Future<void> dispose() async {
    await audioPlayer?.dispose();
    audioPlayer = null;
    progressStream = null;
  }
}
