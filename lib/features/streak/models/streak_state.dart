import 'package:breathe_with_me/features/streak/models/streak_statistics_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'streak_state.freezed.dart';
part 'streak_state.g.dart';

@freezed
class StreakState with _$StreakState {
  const factory StreakState({
    int? selectedDay,
    StreakStatisticsData? statisticsData,
  }) = _StreakState;

  factory StreakState.fromJson(Map<String, dynamic> json) =>
      _$StreakStateFromJson(json);
}
