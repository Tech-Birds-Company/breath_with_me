import 'dart:async';

import 'package:audioplayers/audioplayers.dart';

base class PlayerManager {
  AudioPlayer? audioPlayer;
  Stream<double>? progressStream;

  /// Should be called before [play] or [pause]
  Future<void> init(Source source) async {}

  Future<void> play() async {}

  Future<void> pause() async {}

  Future<void> dispose() async {
    await audioPlayer?.dispose();
    audioPlayer = null;
    progressStream = null;
  }
}
