import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'streaks_progress.freezed.dart';
part 'streaks_progress.g.dart';

@freezed
class StreaksProgress with _$StreaksProgress {
  const factory StreaksProgress({
    required int livesCount,
    required DateTime livesExpireTimestamp,
    required int minutesCount,
    required int practicesCount,
    required List<DateTime> timeline,
  }) = _StreaksProgress;

  const StreaksProgress._();

  int get lastStreaksCount {
    final timeline = this.timeline.sorted((a, b) => b.compareTo(a));

    var count = 1;
    var date =
        DateTime(timeline.first.year, timeline.first.month, timeline.first.day);
    for (var i = 1; i < timeline.length; i++) {
      final expectedDate = date.subtract(const Duration(days: 1));
      final currentDate =
          DateTime(timeline[i].year, timeline[i].month, timeline[i].day);
      if (currentDate == expectedDate) {
        count += 1;
        date = currentDate;
      } else {
        break;
      }
    }

    return count;
  }

  int get lastMissedDaysCount {
    final timeline = this.timeline.sorted((a, b) => b.compareTo(a));

    var count = 0;
    var date =
        DateTime(timeline.first.year, timeline.first.month, timeline.first.day);
    for (var i = 1; i < timeline.length; i++) {
      final expectedDate = date.subtract(const Duration(days: 1));
      final currentDate =
          DateTime(timeline[i].year, timeline[i].month, timeline[i].day);
      if (currentDate != expectedDate) {
        count += 1;
        date = currentDate;
      } else {
        break;
      }
    }

    return count;
  }

  factory StreaksProgress.fromJson(Map<String, dynamic> json) =>
      _$StreaksProgressFromJson(json);
}
