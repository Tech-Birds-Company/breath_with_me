import 'package:breathe_with_me/repositories/models/streak_progress_v2.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'streak_state.freezed.dart';

@freezed
class StreakState with _$StreakState {
  const factory StreakState.loading() = _StreakLoading;

  const factory StreakState.data(StreakProgressV2 streakProgressV2) =
      _StreakData;

  const factory StreakState.error() = _StreakError;
}
