import 'dart:async';

import 'package:breathe_with_me/repositories/firebase_remote_config_repository.dart';
import 'package:breathe_with_me/repositories/models/remote_config.dart';

final class RemoteConfigManager {
  final FirebaseRemoteConfigRepository _firebaseRemoteConfigRepository;

  RemoteConfigManager(this._firebaseRemoteConfigRepository);

  StreamSubscription<RemoteConfig>? _remoteConfigSubscription;

  void init() {
    _remoteConfigSubscription = _firebaseRemoteConfigRepository
        .remoteConfigStream
        .listen(_handleRemoteConfigChanges);
  }

  void _handleRemoteConfigChanges(RemoteConfig config) {
    _firebaseRemoteConfigRepository.saveRemoteConfig(config);
  }

  void dispose() {
    _remoteConfigSubscription?.cancel();
  }
}
