import 'package:breathe_with_me/repositories/models/streak_progress_v2.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'streak_state.freezed.dart';
part 'streak_state.g.dart';

@freezed
class StreakState with _$StreakState {
  const factory StreakState({
    @Default(StreakProgressV2()) StreakProgressV2 progress,
    @Default(false) bool ignoreMissingDays,
  }) = _StreakState;

  factory StreakState.fromJson(Map<String, dynamic> json) =>
      _$StreakStateFromJson(json);
}
