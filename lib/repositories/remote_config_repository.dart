import 'package:breathe_with_me/repositories/models/remote_config_legal_documents.dart';
import 'package:breathe_with_me/repositories/models/remote_config_socials.dart';
import 'package:breathe_with_me/repositories/models/remote_config_streaks.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

enum RemoteConfigKey {
  socials('socials'),
  legalDocuments('legalDocuments');

  final String name;
  const RemoteConfigKey(this.name);
}

abstract interface class RemoteConfigRepository {
  Map<String, RemoteConfigValue> getAllConfigValues();
  T getConfigValue<T>(RemoteConfigKey key);
  RemoteConfigSocials get socials;
  RemoteConfigLegalDocuments get legalDocuments;
  RemoteConfigStreaks get streaks;
}
