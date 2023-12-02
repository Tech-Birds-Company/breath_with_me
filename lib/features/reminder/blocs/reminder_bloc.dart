import 'package:breathe_with_me/features/reminder/models/reminder_state.dart';
import 'package:breathe_with_me/managers/push_notifications/push_notifications_manager.dart';
import 'package:breathe_with_me/utils/cacheable_bloc/cacheable_bloc.dart';

final class ReminderBloc extends CacheableBloc<ReminderState> {
  final PushNotificationsManager _pushNotificationsManager;

  ReminderBloc(this._pushNotificationsManager)
      : super(ReminderState.defaultState);

  void onWeekDaySelected(int weekDay) {
    final selectedWeekDays = Set<int>.from(state.selectedWeekDays);
    if (selectedWeekDays.contains(weekDay)) {
      selectedWeekDays.remove(weekDay);
    } else {
      selectedWeekDays.add(weekDay);
    }
    emit(
      state.copyWith(
        selectedWeekDays: selectedWeekDays,
      ),
    );
  }

  void onHoursChanged(int hours) => emit(
        state.copyWith(
          selectedHours: hours,
        ),
      );

  void onMinutesChanged(int minutes) => emit(
        state.copyWith(
          selectedMinutes: minutes,
        ),
      );

  Future<void> saveReminder() async {
    if (state.selectedWeekDays.isEmpty) {
      await deleteCache();
      return;
    }
    await cache();
    await _pushNotificationsManager.cancelAllNotification();
    for (final selectedWeekDay in state.selectedWeekDays) {
      await _pushNotificationsManager.scheduleDailyNotification(
        selectedWeekDay,
        state.selectedHours,
        state.selectedMinutes,
      );
    }
  }

  @override
  ReminderState fromJson(Map<String, dynamic> json) =>
      ReminderState.fromJson(json);

  @override
  Map<String, dynamic> toJson(ReminderState state) => state.toJson();
}
