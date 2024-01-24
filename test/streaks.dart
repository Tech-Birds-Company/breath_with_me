import 'package:breathe_with_me/managers/streak_progress_manager/streak_progress_manager.dart';
import 'package:breathe_with_me/repositories/models/streak_progress_v2.dart';
import 'package:breathe_with_me/repositories/streaks_progress_repository_v2.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

final class MockStreaksProgressRepository extends StreakProgressRepositoryV2 {
  MockStreaksProgressRepository(super.firestore);
}

final class MockStreakProgressManager extends StreakProgressManager {
  MockStreakProgressManager(
    super.userId,
    super.streaksProgressRepository,
  );
  int get defaultTotalLives => 3;
}

void main() {
  group(
    'Streak progress tests',
    () {
      late MockStreaksProgressRepository streaksProgressRepository;
      late MockStreakProgressManager streakProgressManager;

      const userId = 'bwm_test_user_id';

      setUp(
        () async {
          final firestore = FakeFirebaseFirestore();
          streaksProgressRepository = MockStreaksProgressRepository(firestore);
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

          expect(progress.utcTimeline.length, 3);
          expect(progress.totalLives, streakProgressManager.defaultTotalLives);
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

          expect(progress.utcTimeline.length, 5);
          expect(progress.totalLives, streakProgressManager.defaultTotalLives);
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
          expect(progress.totalLives, streakProgressManager.defaultTotalLives);
          expect(
            progress.totalMinutes,
            68,
          );
          expect(progress.totalStreak, 4);
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
          expect(progress.totalLives, streakProgressManager.defaultTotalLives);
          expect(progress.totalMinutes, 48);
          expect(progress.totalStreak, 1);

          final restoredProgress =
              await streakProgressManager.restoreUserStreakProgress();

          expect(restoredProgress.utcTimeline.length, 3);
          expect(
            restoredProgress.totalLives,
            streakProgressManager.defaultTotalLives - 1,
          );
          expect(restoredProgress.totalMinutes, 48);
          expect(restoredProgress.totalStreak, 3);
        },
      );
    },
  );
}
