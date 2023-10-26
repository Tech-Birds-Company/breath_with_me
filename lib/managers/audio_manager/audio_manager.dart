import 'package:audio_service/audio_service.dart';
import 'package:audioplayers/audioplayers.dart';

abstract base class AudioManager extends BaseAudioHandler {
  Stream<(int?, double, int?)>? progressStream;
  Stream<PlayerState>? onPlayerStateChanged;
  Future<void> init(
    Source source, {
    required String title,
    required String artist,
  });
  void dispose();
}
