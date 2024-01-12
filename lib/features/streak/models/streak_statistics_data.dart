import 'package:freezed_annotation/freezed_annotation.dart';

part 'streak_statistics_data.freezed.dart';
part 'streak_statistics_data.g.dart';

@freezed
class StreakStatisticsData with _$StreakStatisticsData {
  const factory StreakStatisticsData({
    @Default(0) int streaksCount,
    int? practicesCount,
    int? minutesCount,
    int? dayMissedCount,
  }) = _StreakStatisticsData;

  factory StreakStatisticsData.fromJson(Map<String, dynamic> json) =>
      _$StreakStatisticsDataFromJson(json);
}
