import 'dart:async';

abstract interface class PlayerManager {
  Future<void> init();
  Future<void> play();
  Future<void> pause();
  Future<void> dispose();
}
