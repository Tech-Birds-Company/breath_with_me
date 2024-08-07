import 'dart:async';
import 'dart:math';

import 'package:breathe_with_me/repositories/models/streak_progress_v2.dart';
import 'package:breathe_with_me/repositories/streaks_progress_repository_v2.dart';
import 'package:collection/collection.dart';

class StreakProgressManager {
  final String _userId;
  final StreakProgressRepositoryV2 _streaksProgressRepository;

  StreakProgressManager(this._userId, this._streaksProgressRepository);

  Stream<StreakProgressV2> get stream => _streaksProgressRepository
      .getStreakProgressStream(_userId)
      .asyncMap(_validateProgress);

  Future<StreakProgressV2> _validateProgress(StreakProgressV2 progress) async {
    final sortedTimeline =
        progress.utcTimeline.sorted((a, b) => b.compareTo(a));

    final currentStreak = _getCurrentStreak(sortedTimeline).length;
    final missedDays = _calculateMissedDays(sortedTimeline: sortedTimeline);

    if (missedDays != progress.totalMissedDays ||
        currentStreak != progress.totalStreak) {
      return _streaksProgressRepository.setUserProgressData(
        _userId,
        progress.copyWith(
          totalMissedDays: missedDays,
          totalStreak: currentStreak,
        ),
      );
    }
    return progress;
  }

  StreakProgressV2 _calculateCurrentProgress(StreakProgressV2 progress) {
    final sortedTimeline =
        progress.utcTimeline.sorted((a, b) => b.compareTo(a));
    final currentStreak = _getCurrentStreak(sortedTimeline).length;
    final calculatedMissedDays =
        _calculateMissedDays(sortedTimeline: sortedTimeline);

    return progress.copyWith(
      totalStreak: currentStreak,
      totalMissedDays: calculatedMissedDays,
    );
  }

  List<List<DateTime>> _getStreaks(List<DateTime> sortedTimeline) {
    if (sortedTimeline.isEmpty) return [];

    final streaks = <List<DateTime>>[];
    var currentStreak = [sortedTimeline.first];

    for (var i = 1; i < sortedTimeline.length; i++) {
      if (sortedTimeline[i - 1].difference(sortedTimeline[i]).inDays == 1) {
        currentStreak.add(sortedTimeline[i]);
      } else {
        streaks.add(currentStreak);
        currentStreak = [sortedTimeline[i]];
      }
    }

    streaks.add(currentStreak);
    return streaks;
  }

  List<DateTime> _getCurrentStreak(List<DateTime> sortedTimeline) {
    final streaks = _getStreaks(sortedTimeline);
    return streaks.firstOrNull ?? [];
  }

  int _calculateMissedDays({required List<DateTime> sortedTimeline}) {
    final streaks = _getStreaks(sortedTimeline);

    if (streaks.length < 2) {
      return 0; // There are no missed days if there's only one streak or no streaks
    }

    final lastStreakEndDate = streaks[0].last;
    final preLastStreakStartDate = streaks[1].first;

    return lastStreakEndDate.difference(preLastStreakStartDate).inDays - 1;
  }

  Future<StreakProgressV2> addStreakData({
    required int minutes,
    required DateTime date,
  }) async {
    final _ = date.toUtc();
    final utcDate = DateTime.utc(_.year, _.month, _.day);
    final currentProgress =
        await _streaksProgressRepository.getUserStreakProgress(_userId);

    final existingTimeline = currentProgress.utcTimeline;
    final newTimeline = {utcDate, ...existingTimeline}.toList()
      ..sort(
        (a, b) => b.compareTo(a),
      );

    final updatedProgress = _calculateCurrentProgress(
      currentProgress.copyWith(
        totalPractices: currentProgress.totalPractices + 1,
        totalMinutes: currentProgress.totalMinutes + minutes,
        utcTimeline: newTimeline,
      ),
    );

    return _streaksProgressRepository.setUserProgressData(
      _userId,
      updatedProgress,
    );
  }

  Future<StreakProgressV2> getUserStreakProgress() async {
    final progress =
        await _streaksProgressRepository.getUserStreakProgress(_userId);
    return progress;
  }

  Future<StreakProgressV2> restoreUserStreakProgress() async {
    final currentProgress =
        await _streaksProgressRepository.getUserStreakProgress(_userId);
    final sortedTimeline =
        currentProgress.utcTimeline.sorted((a, b) => b.compareTo(a));

    if (sortedTimeline.isEmpty) {
      return currentProgress;
    }

    final streaks = _getStreaks(sortedTimeline);

    if (streaks.length < 2) {
      return currentProgress; // No previous streak to restore
    }

    final missedDays = _calculateMissedDays(sortedTimeline: sortedTimeline);

    if (missedDays == 0) {
      return currentProgress; // No missed days to restore
    }

    if (currentProgress.totalLives < missedDays) {
      // Not enough lives to restore the full gap, reset to the last streak
      return currentProgress.copyWith(
        totalStreak: streaks.last.length,
        utcTimeline: streaks.last,
      );
    }

    // Restore the streak
    final restoredDays = min(currentProgress.totalLives, missedDays);
    final lastStreakEndDate = streaks[0].last;

    final restoredDates = List.generate(
      restoredDays,
      (index) => lastStreakEndDate.subtract(
        Duration(days: index + 1),
      ),
    );

    final newTimeline = [
      ...streaks[0],
      ...restoredDates,
      ...streaks[1],
    ]..sort(
        (a, b) => b.compareTo(a),
      );

    final updatedProgress = currentProgress.copyWith(
      totalStreak: streaks[0].length + restoredDays + streaks[1].length,
      totalMissedDays: 0,
      totalLives: currentProgress.totalLives - restoredDays,
      utcTimeline: newTimeline,
      utcLivesExpireDateTime:
          DateTime.now().toUtc().add(const Duration(days: 30)).copyWith(
                minute: 0,
                hour: 0,
                second: 0,
                millisecond: 0,
                microsecond: 0,
              ),
    );

    return _streaksProgressRepository.setUserProgressData(
      _userId,
      updatedProgress,
    );
  }
}
