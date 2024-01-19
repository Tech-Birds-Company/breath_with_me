import 'dart:convert';

import 'package:breathe_with_me/repositories/models/remote_config/remote_config_legal_documents.dart';
import 'package:breathe_with_me/repositories/models/remote_config/remote_config_premium.dart';
import 'package:breathe_with_me/repositories/models/remote_config/remote_config_socials.dart';
import 'package:breathe_with_me/repositories/models/remote_config/remote_config_streaks.dart';
import 'package:breathe_with_me/repositories/remote_config_repository.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

final class FirebaseRemoteConfigRepository implements RemoteConfigRepository {
  const FirebaseRemoteConfigRepository();

  @override
  RemoteConfigLegalDocuments get legalDocuments {
    final value = FirebaseRemoteConfig.instance
        .getValue(RemoteConfigKey.legalDocuments.key);
    final json = jsonDecode(value.asString()) as Map<String, dynamic>;
    return RemoteConfigLegalDocuments.fromJson(json);
  }

  @override
  RemoteConfigSocials get socials {
    final value =
        FirebaseRemoteConfig.instance.getValue(RemoteConfigKey.socials.key);
    final json = jsonDecode(value.asString()) as Map<String, dynamic>;
    return RemoteConfigSocials.fromJson(json);
  }

  @override
  RemoteConfigPremium get premium {
    final value =
        FirebaseRemoteConfig.instance.getValue(RemoteConfigKey.premium.key);
    final json = jsonDecode(value.asString()) as Map<String, dynamic>;
    return RemoteConfigPremium.fromJson(json);
  }

  @override
  RemoteConfigStreaks get streaks {
    final value = FirebaseRemoteConfig.instance.getValue('streaks');
    final json = jsonDecode(value.asString()) as Map<String, dynamic>;
    return RemoteConfigStreaks.fromJson(json);
  }
}
