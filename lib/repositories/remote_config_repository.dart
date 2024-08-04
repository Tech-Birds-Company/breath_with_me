import 'package:breathe_with_me/repositories/models/remote_config/remote_config_base_premium.dart';
import 'package:breathe_with_me/repositories/models/remote_config/remote_config_legal_documents.dart';
import 'package:breathe_with_me/repositories/models/remote_config/remote_config_socials.dart';
import 'package:breathe_with_me/repositories/models/remote_config/remote_config_streaks.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

enum RemoteConfigKey {
  socials('socials'),
  legalDocuments('legalDocuments'),
  basePremium('base_premium');

  final String key;

  const RemoteConfigKey(this.key);
}

abstract interface class RemoteConfigRepository {
  Stream<RemoteConfigUpdate> get configStream;

  RemoteConfigSocials get socials;

  RemoteConfigLegalDocuments get legalDocuments;

  RemoteConfigStreaks get streaks;

  RemoteConfigBasePremium get basePremium;
}
