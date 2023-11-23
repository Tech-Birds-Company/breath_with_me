import 'dart:async';

import 'package:audio_session/audio_session.dart';
import 'package:audioplayers/audioplayers.dart';

abstract base class PlayerManager {
  AudioPlayer? audioPlayer;
  AudioSession? audioSession;

  /// Should be called before [play] or [pause]
  Future<void> init(Source source);

  Future<void> play();

  Future<void> pause();

  Future<void> stop();

  Future<void> dispose() async {
    await audioPlayer?.dispose();
    audioPlayer = null;
  }
}
