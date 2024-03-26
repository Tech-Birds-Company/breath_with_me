import 'package:breathe_with_me/extensions/string.dart';
import 'package:breathe_with_me/repositories/models/remote_config/remote_config_legal_documents.dart';
import 'package:breathe_with_me/repositories/models/remote_config/remote_config_premium_v2.dart';
import 'package:breathe_with_me/repositories/models/remote_config/remote_config_socials.dart';
import 'package:breathe_with_me/repositories/models/remote_config/remote_config_streaks.dart';
import 'package:breathe_with_me/repositories/remote_config_repository.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

final class FirebaseRemoteConfigRepository implements RemoteConfigRepository {
  const FirebaseRemoteConfigRepository();

  @override
  Stream<RemoteConfigUpdate> get configStream =>
      FirebaseRemoteConfig.instance.onConfigUpdated;

  @override
  RemoteConfigLegalDocuments get legalDocuments {
    final value = FirebaseRemoteConfig.instance
        .getString(RemoteConfigKey.legalDocuments.key);
    return RemoteConfigLegalDocuments.fromJson(value.asJson);
  }

  @override
  RemoteConfigSocials get socials {
    final value =
        FirebaseRemoteConfig.instance.getString(RemoteConfigKey.socials.key);
    return RemoteConfigSocials.fromJson(value.asJson);
  }

  @override
  RemoteConfigPremiumV2 get premiumV2 {
    final value =
        FirebaseRemoteConfig.instance.getString(RemoteConfigKey.premiumV2.key);
    return RemoteConfigPremiumV2.fromJson(value.asJson);
  }

  @override
  RemoteConfigStreaks get streaks {
    final value = FirebaseRemoteConfig.instance.getString('streaks');
    return RemoteConfigStreaks.fromJson(value.asJson);
  }
}
