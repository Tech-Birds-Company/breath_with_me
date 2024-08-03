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
      .asyncMap(_validateStreak);

  Future<StreakProgressV2> _validateStreak(StreakProgressV2 progress) async {
    final timeline = progress.utcTimeline.sorted((a, b) => b.compareTo(a));
    final calculatedMissedDays = _getMissedDays(sortedTimeline: timeline);

    if (calculatedMissedDays != progress.totalMissedDays) {
      final updatedProgress =
          await _streaksProgressRepository.setUserProgressData(
        _userId,
        progress.copyWith(
          totalMissedDays: calculatedMissedDays,
        ),
      );
      return updatedProgress;
    }
    return progress;
  }

  Future<void> checkAndResetStreak() async {
    final currentProgress =
        await _streaksProgressRepository.getUserStreakProgress(_userId);
    final timeline =
        currentProgress.utcTimeline.sorted((a, b) => b.compareTo(a));

    if (timeline.isEmpty) {
      return;
    }

    final now = DateTime.now().toUtc();
    final lastActivityDate = timeline.first;
    final daysSinceLastActivity = now.difference(lastActivityDate).inDays;

    if (daysSinceLastActivity > 1) {
      final resetProgress = currentProgress.copyWith(
        totalStreak: 0,
      );

      await _streaksProgressRepository.setUserProgressData(
        _userId,
        resetProgress,
      );
    }
  }

  Future<StreakProgressV2> addStreakData({
    required int minutes,
    required DateTime date,
  }) async {
    final utcDate = DateTime.utc(date.year, date.month, date.day);
    final currentProgress =
        await _streaksProgressRepository.getUserStreakProgress(_userId);

    final existingTimeline = currentProgress.utcTimeline;
    final newTimeline = _addOrUpdateDate(existingTimeline, utcDate);

    final updatedStreak = _calculateStreak(sortedTimeline: newTimeline);

    // Calculate missed days (if needed)
    final missedDays = _getMissedDays(sortedTimeline: newTimeline);

    final newProgress = currentProgress.copyWith(
      totalStreak: updatedStreak,
      totalPractices: currentProgress.totalPractices + 1,
      totalMinutes: currentProgress.totalMinutes + minutes,
      totalMissedDays: missedDays,
      utcTimeline: newTimeline,
    );

    return _streaksProgressRepository.setUserProgressData(_userId, newProgress);
  }

  List<DateTime> _addOrUpdateDate(List<DateTime> timeline, DateTime newDate) {
    final updatedTimeline = timeline
        .where(
          (date) =>
              date.year != newDate.year ||
              date.month != newDate.month ||
              date.day != newDate.day,
        )
        .toList()
      ..add(newDate);

    return updatedTimeline.sorted((a, b) => b.compareTo(a));
  }

  int _getMissedDays({required List<DateTime> sortedTimeline}) {
    if (sortedTimeline.isEmpty || sortedTimeline.length == 1) {
      return 0;
    }

    var totalMissedDays = 0;
    for (var i = 0; i < sortedTimeline.length - 1; i++) {
      final currentDate = sortedTimeline[i];
      final nextDate = sortedTimeline[i + 1];

      final difference = currentDate.difference(nextDate).inDays - 1;
      if (difference > 0) {
        totalMissedDays += difference;
      }
    }

    return totalMissedDays;
  }

  Future<StreakProgressV2> getUserStreakProgress() =>
      _streaksProgressRepository.getUserStreakProgress(_userId);

  Future<StreakProgressV2> restoreUserStreakProgress() async {
    final currentProgress =
        await _streaksProgressRepository.getUserStreakProgress(_userId);
    var timeline = currentProgress.utcTimeline;

    if (timeline.isEmpty) return currentProgress;

    // Sort timeline in descending order (most recent first)
    timeline = timeline.sorted((a, b) => b.compareTo(a));

    var currentStreak = 0;
    var lastStreak = 0;
    var inCurrentStreak = true;
    DateTime? previousDate;

    for (final date in timeline) {
      if (previousDate == null ||
          date.add(const Duration(days: 1)) == previousDate) {
        if (inCurrentStreak) {
          currentStreak++;
        } else {
          lastStreak++;
        }
      } else if (inCurrentStreak) {
        inCurrentStreak = false;
        lastStreak = 1;
      } else {
        break;
      }
      previousDate = date;
    }

    // Calculate restored days and total restored streak
    final restoredDays = min(currentProgress.totalLives, lastStreak);
    final totalRestoredStreak = currentStreak + restoredDays;

    // Update lives
    final remainingLives = currentProgress.totalLives - restoredDays;

    // Create a new timeline with the restored streak
    final restoredTimeline = List<DateTime>.generate(
      totalRestoredStreak,
      (index) => timeline.first.subtract(Duration(days: index)),
    );

    final dateNow = DateTime.now();
    final utcDate = DateTime.utc(
      dateNow.year,
      dateNow.month,
      dateNow.day,
    );
    final restoredProgress = currentProgress.copyWith(
      totalMissedDays: 0,
      totalLives: remainingLives,
      totalStreak: totalRestoredStreak,
      utcTimeline: restoredTimeline,
      utcLivesExpireDateTime: utcDate.add(
        const Duration(days: 30),
      ),
    );

    return _streaksProgressRepository.setUserProgressData(
      _userId,
      restoredProgress,
    );
  }

  int _calculateStreak({required List<DateTime> sortedTimeline}) {
    if (sortedTimeline.isEmpty) return 0;

    var streak = 1;
    var previousDate = sortedTimeline.first;
    for (var i = 1; i < sortedTimeline.length; i++) {
      if (sortedTimeline[i].add(const Duration(days: 1)) == previousDate) {
        streak++;
        previousDate = sortedTimeline[i];
      } else {
        break;
      }
    }
    return streak;
  }
}
