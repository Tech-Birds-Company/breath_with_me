import 'package:breathe_with_me/repositories/models/streaks_progress.dart';

abstract interface class StreaksProgressRepository {
  const StreaksProgressRepository();

  Future<StreaksProgress> addPractice(
    String userId,
    DateTime timestamp,
    int minutesCount,
    int monthLivesCount,
  );

  Future<StreaksProgress> restoreStreak(
    String userId,
    DateTime timestamp,
    int monthLivesCount,
  );

  Future<StreaksProgress> getStreaksProgress(
    String userId,
    int monthLivesCount,
  );
}
