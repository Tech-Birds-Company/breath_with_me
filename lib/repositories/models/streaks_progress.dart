import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'streaks_progress.freezed.dart';
part 'streaks_progress.g.dart';

@freezed
class StreaksProgress with _$StreaksProgress {
  factory StreaksProgress({
    required int livesCount,
    required DateTime livesExpireTimestamp,
    required int minutesCount,
    required int practicesCount,
    required List<DateTime> timeline,
  }) = _StreaksProgress;

  StreaksProgress._();

  late final _sortedTimeline = timeline.sorted(
    (a, b) => b.compareTo(a),
  );

  int get streaksCount {
    if (_sortedTimeline.isEmpty) {
      return 0;
    }

    var count = 1;
    var date = DateTime(
      _sortedTimeline.first.year,
      _sortedTimeline.first.month,
      _sortedTimeline.first.day,
    );

    for (var i = 1; i < _sortedTimeline.length; i++) {
      final expectedDate = date.subtract(const Duration(days: 1));
      final currentDate = DateTime(
        _sortedTimeline[i].year,
        _sortedTimeline[i].month,
        _sortedTimeline[i].day,
      );
      if (currentDate == expectedDate) {
        count += 1;
        date = currentDate;
      } else {
        break;
      }
    }

    return count;
  }

  int get missedDaysCount {
    if (_sortedTimeline.isEmpty) {
      return 0;
    }

    var count = 0;
    var date = DateTime(
      _sortedTimeline.first.year,
      _sortedTimeline.first.month,
      _sortedTimeline.first.day,
    );

    for (var i = 1; i < _sortedTimeline.length; i++) {
      final expectedDate = date.subtract(const Duration(days: 1));
      final currentDate = DateTime(
        _sortedTimeline[i].year,
        _sortedTimeline[i].month,
        _sortedTimeline[i].day,
      );
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
