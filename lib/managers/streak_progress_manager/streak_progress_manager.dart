import 'dart:async';

import 'package:breathe_with_me/repositories/models/streak_progress_v2.dart';
import 'package:breathe_with_me/repositories/streaks_progress_repository_v2.dart';

extension DateTimeExtension on DateTime {
  DateTime get utc => DateTime.utc(year, month, day);
}

class StreakProgressManager {
  final String _userId;
  final StreakProgressRepositoryV2 _streaksProgressRepository;

  StreakProgressManager(
    this._userId,
    this._streaksProgressRepository,
  );

  Stream<StreakProgressV2> get stream =>
      _streaksProgressRepository.getStreakProgressStream(_userId);

  Future<StreakProgressV2> addStreakData({
    required int minutes,
    required DateTime date,
  }) async {
    final utcDate = date.utc;
    final currentProgress =
        await _streaksProgressRepository.getUserStreakProgress(_userId);

    final currentTimeline = currentProgress.utcTimeline;
    final missedDays = _calculateMissedDays(
      [...currentTimeline, utcDate]..sort(),
    );
    final newTimeline = [...currentProgress.utcTimeline, utcDate];
    final sortedTimeline = newTimeline..sort();

    final updatedStreak = _calculateStreak(sortedTimeline);

    final newProgress = StreakProgressV2(
      totalStreak: updatedStreak,
      totalPractices: currentProgress.totalPractices + 1,
      totalLives: currentProgress.totalLives,
      totalMinutes: currentProgress.totalMinutes + minutes,
      totalMissedDays: missedDays,
      utcTimeline: {...currentProgress.utcTimeline, utcDate}.toList(),
      utcLivesExpireDateTime: currentProgress.utcLivesExpireDateTime,
    );

    final updatedProgress = await _streaksProgressRepository
        .setUserProgressData(_userId, newProgress);
    return updatedProgress;
  }

  Future<StreakProgressV2> getUserStreakProgress() async {
    var progress =
        await _streaksProgressRepository.getUserStreakProgress(_userId);

    if (progress.utcLivesExpireDateTime == null) {
      progress = await _streaksProgressRepository.refillTotalLives(
        _userId,
        _nextUtcExpireDateTime,
      );
    } else if (progress.utcLivesExpireDateTime!.isBefore(DateTime.now().utc)) {
      progress = await _streaksProgressRepository.refillTotalLives(
        _userId,
        _nextUtcExpireDateTime,
      );
    }

    return progress;
  }

  Future<StreakProgressV2> restoreUserStreakProgress() async {
    final currentProgress =
        await _streaksProgressRepository.getUserStreakProgress(_userId);
    final totalStreak = currentProgress.totalStreak;
    final totalLives = currentProgress.totalLives;
    final totalMissedDays = currentProgress.totalMissedDays;

    if (totalLives < totalMissedDays) {
      return currentProgress;
    }

    final currentTimelineLength = currentProgress.utcTimeline.length;
    final sortedTimeline = [...currentProgress.utcTimeline]..sort();
    final oldTimeline =
        sortedTimeline.sublist(0, currentTimelineLength - totalStreak);
    final oldStreak = _calculateStreak(oldTimeline);
    final newTimeline = <DateTime>[];
    final lastDate = sortedTimeline.last;
    for (var i = 0; i < oldStreak; i++) {
      newTimeline.add(lastDate.subtract(Duration(days: i)));
    }

    final restoredProgress = currentProgress.copyWith(
      totalMissedDays: 0,
      totalLives: totalLives - totalMissedDays,
      totalStreak: oldStreak + totalMissedDays + totalStreak,
      utcTimeline: newTimeline,
    );
    await _streaksProgressRepository.setUserProgressData(
      _userId,
      restoredProgress,
    );
    return restoredProgress;
  }

  int _calculateStreak(List<DateTime> sortedTimeline) {
    if (sortedTimeline.isEmpty) {
      return 0;
    }

    // Assuming sortedTimeline is already sorted in ascending order
    final uniqueDays = <DateTime>[];
    for (final date in sortedTimeline) {
      if (uniqueDays.isEmpty || !_isSameDay(uniqueDays.last, date)) {
        uniqueDays.add(date);
      }
    }

    var longestStreak = 0;
    var currentStreak = 1;
    var lastDate = uniqueDays.first;
    var endDateOfLongestStreak = lastDate;

    for (var i = 1; i < uniqueDays.length; i++) {
      final currentDate = uniqueDays[i];
      final expectedNextDay = DateTime(
        lastDate.year,
        lastDate.month,
        lastDate.day + 1,
      );

      if (_isSameDay(currentDate, expectedNextDay)) {
        currentStreak++;
      } else {
        if (currentStreak > longestStreak) {
          longestStreak = currentStreak;
          endDateOfLongestStreak = lastDate;
        }
        currentStreak = 1;
      }

      lastDate = currentDate;
    }

    // After the loop, check if the ending streak is the longest
    if (currentStreak > longestStreak) {
      longestStreak = currentStreak;
      endDateOfLongestStreak = lastDate;
    }

    // Check if the longest streak is the most recent one
    if (endDateOfLongestStreak == uniqueDays.last) {
      return longestStreak;
    } else {
      // If the most recent streak is not the longest, find the length of the most recent streak
      var mostRecentStreak = 1;
      for (var i = uniqueDays.length - 2; i >= 0; i--) {
        if (_isSameDay(
          uniqueDays[i + 1],
          DateTime(
            uniqueDays[i].year,
            uniqueDays[i].month,
            uniqueDays[i].day + 1,
          ),
        )) {
          mostRecentStreak++;
        } else {
          break;
        }
      }
      return mostRecentStreak;
    }
  }

  int _calculateMissedDays(List<DateTime> sortedDates) {
    // Check if the list is empty or has only one date
    if (sortedDates.length <= 1) {
      return 0;
    }

    var missedDays = 0;

    // Iterate through the dates, starting from the second date
    for (var i = 1; i < sortedDates.length; i++) {
      // Calculate the difference in days between the current date and the previous date
      final differenceInDays =
          sortedDates[i].difference(sortedDates[i - 1]).inDays;

      // If the difference is more than one day, add the missed days (difference - 1)
      if (differenceInDays > 1) {
        missedDays += differenceInDays - 1;
      }
    }

    return missedDays;
  }

  bool _isSameDay(DateTime date1, DateTime date2) =>
      date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day;

  DateTime get _nextUtcExpireDateTime {
    final now = DateTime.now().toUtc();
    if (now.month == 12) {
      return DateTime(now.year + 1);
    } else {
      return DateTime(now.year, now.month + 1);
    }
  }
}
