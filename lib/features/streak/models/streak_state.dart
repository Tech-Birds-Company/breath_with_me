import 'package:breathe_with_me/features/streak/models/streak_content_state.dart';
import 'package:breathe_with_me/repositories/models/streaks_progress.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'streak_state.freezed.dart';
part 'streak_state.g.dart';

@freezed
class StreakState with _$StreakState {
  const factory StreakState(
    StreaksProgress? progress,
    StreakContentState contentState,
  ) = _StreakState;

  factory StreakState.fromJson(Map<String, dynamic> json) =>
      _$StreakStateFromJson(json);
}
