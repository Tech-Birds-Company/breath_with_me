import 'package:freezed_annotation/freezed_annotation.dart';

part 'streak_state.freezed.dart';
part 'streak_state.g.dart';

@freezed
class StreakState with _$StreakState {
  static const initialState = StreakState();

  const factory StreakState({
    int? selectedDay,
  }) = _StreakState;

  factory StreakState.fromJson(Map<String, dynamic> json) => _$StreakStateFromJson(json);
}
