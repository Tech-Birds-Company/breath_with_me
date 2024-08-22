import 'package:breathe_with_me/managers/streak_progress_manager/streak_progress_manager.dart';
import 'package:breathe_with_me/repositories/models/remote_config/remote_config_base_premium.dart';
import 'package:breathe_with_me/repositories/models/remote_config/remote_config_legal_documents.dart';
import 'package:breathe_with_me/repositories/models/remote_config/remote_config_socials.dart';
import 'package:breathe_with_me/repositories/models/remote_config/remote_config_streaks.dart';
import 'package:breathe_with_me/repositories/remote_config_repository.dart';
import 'package:breathe_with_me/repositories/streaks_progress_repository_v2.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

final class MockRemoteConfig implements RemoteConfigRepository {
  @override
  RemoteConfigLegalDocuments get legalDocuments => throw UnimplementedError();

  @override
  RemoteConfigSocials get socials => throw UnimplementedError();

  @override
  RemoteConfigStreaks get streaks => const RemoteConfigStreaks();

  @override
  Stream<RemoteConfigUpdate> get configStream => const Stream.empty();

  @override
  RemoteConfigBasePremium get basePremium => RemoteConfigBasePremium(
        ios: BasePremiumPlatform(
          annualIdentifier: '',
          threeMonthsIdentfier: '',
        ),
        android: BasePremiumPlatform(
          annualIdentifier: '',
          threeMonthsIdentfier: '',
        ),
      );
}

final class MockStreaksProgressRepository extends StreakProgressRepositoryV2 {
  MockStreaksProgressRepository(super.firestore, super.remoteConfig);
}

final class MockStreakProgressManager extends StreakProgressManager {
  MockStreakProgressManager(
    super.userId,
    super.streaksProgressRepository,
  );
}

void main() {}
