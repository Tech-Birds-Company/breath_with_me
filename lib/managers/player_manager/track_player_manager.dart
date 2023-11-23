import 'dart:async';

import 'package:audio_session/audio_session.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:breathe_with_me/managers/player_manager/player_manager.dart';

final class TrackPlayerManager extends PlayerManager {
  @override
  Future<void> init(Source source) async {
    await _setupAudioSession();
    audioPlayer ??= AudioPlayer();
    await audioPlayer!.setSource(source);
  }

  Future<void> _setupAudioSession() async {
    audioSession = await AudioSession.instance;
    await audioSession!.configure(const AudioSessionConfiguration.music());
    audioSession?.interruptionEventStream.listen(_handleInteractions);
  }

  void _handleInteractions(AudioInterruptionEvent event) => pause();

  @override
  Future<void> play() async {
    final source = audioPlayer?.source;
    if (source != null) {
      if (await audioSession?.setActive(true) ?? false) {
        await audioPlayer?.play(source);
      }
    }
  }

  @override
  Future<void> pause() async {
    await audioPlayer?.pause();
    await audioSession?.setActive(false);
  }

  @override
  Future<void> stop() async {
    await audioPlayer?.stop();
    await audioSession?.setActive(false);
  }
}
