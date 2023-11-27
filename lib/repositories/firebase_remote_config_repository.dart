import 'dart:convert';

import 'package:breathe_with_me/managers/database_manager/database_manager.dart';
import 'package:breathe_with_me/repositories/models/remote_config.dart';
import 'package:breathe_with_me/repositories/remote_config_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final class FirebaseRemoteConfigRepository
    implements RemoteConfigRepository<RemoteConfig> {
  static const _configPath = 'remote_config/config';

  final DatabaseManager _databaseManager;

  const FirebaseRemoteConfigRepository(this._databaseManager);

  @override
  Future<RemoteConfig> getRemoteConfig() async {
    final localConfigEntity = await _databaseManager.getRemoteConfig();
    if (localConfigEntity != null) {
      final json = jsonDecode(localConfigEntity.json) as Map<String, Object?>;
      final config = RemoteConfig.fromJson(json);
      return config;
    }

    final snapshot = await FirebaseFirestore.instance.doc(_configPath).get();
    final snapshotData = snapshot.data();

    final config = snapshotData != null
        ? RemoteConfig.fromJson(snapshotData)
        : RemoteConfig.defaultConfig;

    await saveRemoteConfig(config);

    return config;
  }

  @override
  Stream<RemoteConfig> get remoteConfigStream => FirebaseFirestore.instance
      .doc(_configPath)
      .snapshots()
      .map(
        (snapshot) {
          final snapshotData = snapshot.data();
          if (snapshotData != null) {
            return RemoteConfig.fromJson(snapshotData);
          }

          return RemoteConfig.defaultConfig;
        },
      )
      .asBroadcastStream()
      .distinct();

  @override
  Future<void> saveRemoteConfig(RemoteConfig config) =>
      _databaseManager.saveRemoteConfig(config.toJson());
}
