import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';

abstract base class AudioManager extends BaseAudioHandler {
  Stream<(int?, double, int?)>? progressStream;
  Stream<PlayerState>? onPlayerStateChanged;

  Future<void> init(
    AudioSource source, {
    required String title,
    required String artist,
  });

  void dispose();
}
