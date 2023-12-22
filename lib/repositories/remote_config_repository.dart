import 'package:breathe_with_me/repositories/models/remote_config_legal_documents.dart';
import 'package:breathe_with_me/repositories/models/remote_config_premium.dart';
import 'package:breathe_with_me/repositories/models/remote_config_socials.dart';

enum RemoteConfigKey {
  socials('socials'),
  legalDocuments('legalDocuments'),
  premium('premium');

  final String key;
  const RemoteConfigKey(this.key);
}

abstract interface class RemoteConfigRepository {
  RemoteConfigSocials get socials;
  RemoteConfigLegalDocuments get legalDocuments;
  RemoteConfigPremium get premium;
}
