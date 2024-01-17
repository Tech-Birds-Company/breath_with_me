import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reminder_state.freezed.dart';
part 'reminder_state.g.dart';

@freezed
class ReminderState with _$ReminderState {
  static final defaultState = ReminderState(
    selectedHours: DateTime.now().toLocal().hour,
    selectedMinutes: DateTime.now().toLocal().minute,
  );

  const factory ReminderState({
    required int selectedHours,
    required int selectedMinutes,
    @Default({}) Set<int> selectedWeekDays,
  }) = _ReminderState;

  const ReminderState._();

  bool get isReminderEnabled => selectedWeekDays.isNotEmpty;

  factory ReminderState.fromJson(Map<String, dynamic> json) =>
      _$ReminderStateFromJson(json);
}
