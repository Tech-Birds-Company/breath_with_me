import 'dart:math';

import 'package:breathe_with_me/managers/streak_progress_manager/streak_progress_manager.dart';
import 'package:breathe_with_me/repositories/models/remote_config/remote_config_base_premium.dart';
import 'package:breathe_with_me/repositories/models/remote_config/remote_config_legal_documents.dart';
import 'package:breathe_with_me/repositories/models/remote_config/remote_config_socials.dart';
import 'package:breathe_with_me/repositories/models/remote_config/remote_config_streaks.dart';
import 'package:breathe_with_me/repositories/models/streak_progress_v2.dart';
import 'package:breathe_with_me/repositories/remote_config_repository.dart';
import 'package:breathe_with_me/repositories/streaks_progress_repository_v2.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_test/flutter_test.dart';

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

void main() {
  group(
    'Streak progress tests',
    () {
      late MockStreaksProgressRepository streaksProgressRepository;
      late MockStreakProgressManager streakProgressManager;
      late final mockRemoteConfig = MockRemoteConfig();
      const userId = 'bwm_test_user_id';

      setUp(
        () async {
          final firestore = FakeFirebaseFirestore();

          streaksProgressRepository = MockStreaksProgressRepository(
            firestore,
            mockRemoteConfig,
          );
          streakProgressManager = MockStreakProgressManager(
            userId,
            streaksProgressRepository,
          );
        },
      );

      test(
        'Simple progress update tests',
        () async {
          final dateNow = DateTime.now();
          late StreakProgressV2 progress;
          progress = await streakProgressManager.addStreakData(
            minutes: 10,
            date: dateNow,
          );
          progress = await streakProgressManager.addStreakData(
            minutes: 3,
            date: dateNow.add(
              const Duration(minutes: 15),
            ),
          );
          progress = await streakProgressManager.addStreakData(
            minutes: 2,
            date: dateNow.add(
              const Duration(minutes: 30),
            ),
          );

          expect(progress.utcTimeline.length, 1);
          expect(
            progress.totalLives,
            mockRemoteConfig.streaks.monthLivesCount,
          );
          expect(progress.totalMinutes, 15);
          expect(progress.totalStreak, 1);
          expect(progress.totalMissedDays, 0);
        },
      );

      test(
        'Simple streak',
        () async {
          final dateNow = DateTime.now();
          late StreakProgressV2 progress;
          progress = await streakProgressManager.addStreakData(
            minutes: 3,
            date: dateNow,
          );
          progress = await streakProgressManager.addStreakData(
            minutes: 8,
            date: dateNow.add(
              const Duration(minutes: 15),
            ),
          );
          progress = await streakProgressManager.addStreakData(
            minutes: 4,
            date: dateNow.add(
              const Duration(hours: 1),
            ),
          );
          progress = await streakProgressManager.addStreakData(
            minutes: 13,
            date: dateNow.add(
              const Duration(days: 1),
            ),
          );
          progress = await streakProgressManager.addStreakData(
            minutes: 10,
            date: dateNow.add(
              const Duration(days: 2),
            ),
          );

          expect(progress.utcTimeline.length, 3);
          expect(
            progress.totalLives,
            mockRemoteConfig.streaks.monthLivesCount,
          );
          expect(progress.totalMinutes, 38);
          expect(progress.totalStreak, 3);
        },
      );
      test(
        'Reset streak',
        () async {
          final dateNow = DateTime.now();
          late StreakProgressV2 progress;
          progress = await streakProgressManager.addStreakData(
            minutes: 3,
            date: dateNow,
          );
          progress = await streakProgressManager.addStreakData(
            minutes: 8,
            date: dateNow.add(
              const Duration(days: 1),
            ),
          );
          progress = await streakProgressManager.addStreakData(
            minutes: 4,
            date: dateNow.add(
              const Duration(days: 2),
            ),
          );
          progress = await streakProgressManager.addStreakData(
            minutes: 13,
            date: dateNow.add(
              const Duration(days: 3),
            ),
          );
          progress = await streakProgressManager.addStreakData(
            minutes: 10,
            date: dateNow.add(
              const Duration(days: 5),
            ),
          );
          progress = await streakProgressManager.addStreakData(
            minutes: 10,
            date: dateNow.add(
              const Duration(days: 6),
            ),
          );
          progress = await streakProgressManager.addStreakData(
            minutes: 10,
            date: dateNow.add(
              const Duration(days: 7),
            ),
          );
          progress = await streakProgressManager.addStreakData(
            minutes: 10,
            date: dateNow.add(
              const Duration(days: 8),
            ),
          );

          expect(progress.utcTimeline.length, 8);
          expect(
            progress.totalLives,
            mockRemoteConfig.streaks.monthLivesCount,
          );
          expect(
            progress.totalMinutes,
            68,
          );
          expect(progress.totalStreak, 4);
        },
      );

      group(
        'Restore',
        () {
          test(
            'Simple restore',
            () async {
              final initialDate = DateTime.utc(2024, 1, 20);
              late StreakProgressV2 progress;
              progress = await streakProgressManager.addStreakData(
                minutes: 3,
                date: initialDate,
              );
              expect(progress.totalPractices, 1);
              expect(progress.totalStreak, 1);
              expect(progress.totalMissedDays, 0);
              final secondDate = initialDate.add(const Duration(days: 2));
              progress = await streakProgressManager.addStreakData(
                minutes: 8,
                date: secondDate,
              );
              expect(progress.totalPractices, 2);
              expect(progress.totalStreak, 1);
              expect(progress.totalMissedDays, 1);
              progress =
                  await streakProgressManager.restoreUserStreakProgress();
              expect(progress.totalStreak, 2);
            },
          );
          test(
            'Restore progress',
            () async {
              final dateNow = DateTime.now();
              late StreakProgressV2 progress;
              progress = await streakProgressManager.addStreakData(
                minutes: 3,
                date: dateNow,
              );
              progress = await streakProgressManager.addStreakData(
                minutes: 18,
                date: dateNow.add(const Duration(days: 1)),
              );
              progress = await streakProgressManager.addStreakData(
                minutes: 17,
                date: dateNow.add(const Duration(days: 2)),
              );
              // skip 3 days
              progress = await streakProgressManager.addStreakData(
                minutes: 10,
                date: dateNow.add(const Duration(days: 6)),
              );

              expect(progress.utcTimeline.length, 4);
              expect(
                progress.totalLives,
                mockRemoteConfig.streaks.monthLivesCount,
              );
              expect(progress.totalMinutes, 48);
              expect(progress.totalStreak, 1);

              final restoredProgress =
                  await streakProgressManager.restoreUserStreakProgress();

              expect(restoredProgress.utcTimeline.length, 4);
              expect(
                restoredProgress.totalLives,
                0,
              );
              expect(restoredProgress.totalMinutes, 48);
              expect(restoredProgress.totalStreak, 4);
            },
          );
          test(
            'Long restore',
            () async {
              const longestStreakDuration = 200;
              final dateNow = DateTime.now();
              final startDate = dateNow
                  .subtract(const Duration(days: 3))
                  .subtract(const Duration(days: longestStreakDuration));
              for (final i
                  in List.generate(longestStreakDuration, (index) => index)) {
                await streakProgressManager.addStreakData(
                  minutes: Random().nextInt(11) + 4,
                  date: startDate.add(Duration(days: i)),
                );
              }
              await streakProgressManager.addStreakData(
                minutes: 10,
                date: dateNow,
              );
              await streakProgressManager.addStreakData(
                minutes: 4,
                date: dateNow.add(const Duration(days: 1)),
              );
              await streakProgressManager.addStreakData(
                minutes: 2,
                date: dateNow.add(const Duration(days: 2)),
              );
              final progress =
                  await streakProgressManager.restoreUserStreakProgress();
              expect(progress.totalStreak, 6);
            },
          );
        },
      );
    },
  );
}
