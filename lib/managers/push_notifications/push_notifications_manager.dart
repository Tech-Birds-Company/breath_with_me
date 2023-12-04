import 'package:app_settings/app_settings.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:uuid/uuid.dart';

final class PushNotificationsManager {
  late final _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<bool?> init() {
    return _flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('app_icon'),
        iOS: DarwinInitializationSettings(
          requestAlertPermission: false,
          requestBadgePermission: false,
          requestSoundPermission: false,
          onDidReceiveLocalNotification: _onLocalMessage,
        ),
      ),
      onDidReceiveBackgroundNotificationResponse: _onBackgroundMessage,
      onDidReceiveNotificationResponse: _onMessage,
    );
  }

  DateTime _scheduleNextWeekday(int weekday, int hour, int minute) {
    final now = DateTime.now().toLocal();
    int daysToAdd;

    if (now.weekday == weekday) {
      // If today is the target weekday
      if (now.hour < hour || (now.hour == hour && now.minute < minute)) {
        // If the current time is before the scheduled time today
        daysToAdd = 0;
      } else {
        // If the current time is after the scheduled time today
        daysToAdd = 7;
      }
    } else {
      // If today is not the target weekday
      daysToAdd = (weekday - now.weekday + 7) % 7;
      if (daysToAdd == 0) {
        daysToAdd = 7;
      }
    }

    return DateTime(
      now.year,
      now.month,
      now.day + daysToAdd,
      hour,
      minute,
    );
  }

  Future<void> scheduleDailyNotification(
    int weekDay,
    int hours,
    int minutes,
  ) async {
    final title = LocaleKeys.reminderNotificationTitle.tr();
    final body = LocaleKeys.reminderNotificationDescription.tr();
    const notificationDetails = NotificationDetails(
      iOS: DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
        badgeNumber: 1,
        threadIdentifier: 'bwm_practice_reminder',
      ),
      android: AndroidNotificationDetails(
        'bwm_practice_reminder_channel_id',
        'bwm_practice_reminder_channel_name',
        importance: Importance.max,
        priority: Priority.high,
      ),
    );
    final scheduledTimezone = tz.TZDateTime.from(
      _scheduleNextWeekday(weekDay, hours, minutes),
      tz.local,
    );
    final uuid = const Uuid().v4().hashCode;
    await _flutterLocalNotificationsPlugin.zonedSchedule(
      uuid,
      title,
      body,
      scheduledTimezone,
      notificationDetails,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.alarmClock,
    );
  }

  Future<void> openPushNotificationsSettings() => AppSettings.openAppSettings(
        type: AppSettingsType.notification,
      );

  static void _onBackgroundMessage(NotificationResponse response) {}

  static void _onMessage(NotificationResponse response) {}

  static void _onLocalMessage(
    int id,
    String? title,
    String? body,
    String? payload,
  ) {}

  Future<void> cancelNotification(int id) =>
      _flutterLocalNotificationsPlugin.cancel(id);

  Future<void> cancelAllNotification() =>
      _flutterLocalNotificationsPlugin.cancelAll();
}
