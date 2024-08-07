import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'streak_progress_v2.freezed.dart';

part 'streak_progress_v2.g.dart';

@freezed
class StreakProgressV2 with _$StreakProgressV2 {
  const factory StreakProgressV2({
    @Default(0) int totalStreak,
    @Default(0) int totalPractices,
    @Default(0) int totalLives,
    @Default(0) int totalMinutes,
    @Default(0) int totalMissedDays,
    @Default([]) List<DateTime> utcTimeline,
    DateTime? utcLivesExpireDateTime,
  }) = _StreakProgressV2;

  const StreakProgressV2._();

  String? get lastPracticeDate {
    if (utcTimeline.isEmpty) {
      return null;
    }

    final format = DateFormat('dd.MM.yyyy');
    final lastPracticeDate = utcTimeline.sorted((a, b) => b.compareTo(a)).first;

    return format.format(lastPracticeDate);
  }

  bool get canRestore {
    if (totalMissedDays < 1 || totalLives < 1) {
      return false;
    }

    return totalMissedDays <= totalLives;
  }

  factory StreakProgressV2.fromJson(Map<String, dynamic> json) =>
      _$StreakProgressV2FromJson(json);
}
