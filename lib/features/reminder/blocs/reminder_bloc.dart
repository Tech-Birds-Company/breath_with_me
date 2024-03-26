import 'package:breathe_with_me/features/reminder/models/reminder_state.dart';
import 'package:breathe_with_me/managers/database_manager/database_cached_keys.dart';
import 'package:breathe_with_me/managers/push_notifications/push_notifications_manager.dart';
import 'package:breathe_with_me/utils/analytics/bwm_analytics.dart';
import 'package:breathe_with_me/utils/cacheable_bloc/cacheable_bloc.dart';

final class ReminderBloc extends CacheableBloc<ReminderState> {
  final PushNotificationsManager _pushNotificationsManager;

  ReminderBloc(this._pushNotificationsManager)
      : super(ReminderState.defaultState);

  @override
  String get key => DatabaseCachedKeys.cachedReminderKey;

  void onWeekDaySelected(int weekDay) {
    BWMAnalytics.event(
      'onReminderWeekDaySelected',
      params: {
        'weekDay': weekDay.toString(),
      },
    );
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

  void onHoursChanged(int hours) {
    BWMAnalytics.event(
      'onReminderHoursChanged',
      params: {
        'hours': hours.toString(),
      },
    );
    emit(
      state.copyWith(
        selectedHours: hours,
      ),
    );
  }

  void onMinutesChanged(int minutes) {
    BWMAnalytics.event(
      'onReminderMinutesChanged',
      params: {
        'minutes': minutes.toString(),
      },
    );
    emit(
      state.copyWith(
        selectedMinutes: minutes,
      ),
    );
  }

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
    BWMAnalytics.event(
      'onReminderScheduled',
      params: {
        'selectedWeekDays': state.selectedWeekDays.toString(),
        'selectedHours': state.selectedHours.toString(),
        'selectedMinutes': state.selectedMinutes.toString(),
      },
    );
  }

  @override
  ReminderState fromJson(Map<String, dynamic> json) =>
      ReminderState.fromJson(json);

  @override
  Map<String, dynamic> toJson(ReminderState state) => state.toJson();
}
