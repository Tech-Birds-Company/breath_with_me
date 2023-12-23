import 'dart:convert';

import 'package:breathe_with_me/repositories/models/remote_config_legal_documents.dart';
import 'package:breathe_with_me/repositories/models/remote_config_socials.dart';
import 'package:breathe_with_me/repositories/remote_config_repository.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

final class FirebaseRemoteConfigRepository implements RemoteConfigRepository {
  const FirebaseRemoteConfigRepository();

  @override
  Map<String, RemoteConfigValue> getAllConfigValues() =>
      FirebaseRemoteConfig.instance.getAll();

  @override
  T getConfigValue<T>(RemoteConfigKey key) {
    final value = FirebaseRemoteConfig.instance.getValue(key.name);
    return value as T;
  }

  @override
  RemoteConfigLegalDocuments get legalDocuments {
    final value = FirebaseRemoteConfig.instance.getValue('legalDocuments');
    final json = jsonDecode(value.asString()) as Map<String, dynamic>;
    return RemoteConfigLegalDocuments.fromJson(json);
  }

  @override
  RemoteConfigSocials get socials {
    final value = FirebaseRemoteConfig.instance.getValue('socials');
    final json = jsonDecode(value.asString()) as Map<String, dynamic>;
    return RemoteConfigSocials.fromJson(json);
  }
}
