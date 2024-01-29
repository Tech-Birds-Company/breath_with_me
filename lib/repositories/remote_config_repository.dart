import 'package:breathe_with_me/repositories/models/remote_config/remote_config_legal_documents.dart';
import 'package:breathe_with_me/repositories/models/remote_config/remote_config_premium_v2.dart';
import 'package:breathe_with_me/repositories/models/remote_config/remote_config_socials.dart';
import 'package:breathe_with_me/repositories/models/remote_config/remote_config_streaks.dart';

enum RemoteConfigKey {
  socials('socials'),
  legalDocuments('legalDocuments'),
  premiumV2('premiumV2');

  final String key;

  const RemoteConfigKey(this.key);
}

abstract interface class RemoteConfigRepository {
  RemoteConfigSocials get socials;

  RemoteConfigLegalDocuments get legalDocuments;

  RemoteConfigPremiumV2 get premiumV2;

  RemoteConfigStreaks get streaks;
}
