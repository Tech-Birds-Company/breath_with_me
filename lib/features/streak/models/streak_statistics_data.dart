import 'package:freezed_annotation/freezed_annotation.dart';

part 'streak_statistics_data.freezed.dart';
part 'streak_statistics_data.g.dart';

@freezed
class StreakStatisticsData with _$StreakStatisticsData {
  const factory StreakStatisticsData.full(
    int streaksCount,
    int practicesCount,
    int minutesCount,
  ) = _Full;
  const factory StreakStatisticsData.missed(
    int streaksCount,
    int missedDaysCount,
  ) = _Missed;

  factory StreakStatisticsData.fromJson(Map<String, dynamic> json) =>
      _$StreakStatisticsDataFromJson(json);
}
