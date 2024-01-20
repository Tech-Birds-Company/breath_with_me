import 'dart:async';

import 'package:audio_session/audio_session.dart';
import 'package:breathe_with_me/managers/player_manager/player_manager.dart';
import 'package:just_audio/just_audio.dart';

final class TrackPlayerManager extends PlayerManager {
  @override
  Future<void> init(AudioSource source) async {
    await _setupAudioSession();
    audioPlayer ??= AudioPlayer();
    await audioPlayer!.setAudioSource(source);
  }

  Future<void> _setupAudioSession() async {
    audioSession = await AudioSession.instance;
    await audioSession!.configure(const AudioSessionConfiguration.music());
    audioSession?.interruptionEventStream.listen(_handleInteractions);
  }

  Future<void> _handleInteractions(AudioInterruptionEvent event) => pause();

  @override
  Future<void> play() async {
    final source = audioPlayer?.audioSource;
    if (source != null) {
      if (await audioSession?.setActive(true) ?? false) {
        await audioPlayer?.play();
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
