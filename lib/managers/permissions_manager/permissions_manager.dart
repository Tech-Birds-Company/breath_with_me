import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:breathe_with_me/utils/analytics/bwm_analytics.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final class PermissionsManager {
  late final _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> handleAppTracking() async {
    final status = await AppTrackingTransparency.trackingAuthorizationStatus;
    if (status != TrackingStatus.notSupported) {
      final status =
          await AppTrackingTransparency.requestTrackingAuthorization();
      BWMAnalytics.event('appTrackingStatus', params: {'status': status});
    } else {
      BWMAnalytics.event('appTrackingNotSupported');
    }
  }

  Future<bool> requestPushNotificationsPermissions() async {
    if (Platform.isIOS) {
      final iosGranted = await _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
      BWMAnalytics.event(
        'pushNotificationsPermissions',
        params: {
          'platform': 'ios',
          'granted': iosGranted ?? false,
        },
      );
      return iosGranted ?? false;
    } else if (Platform.isAndroid) {
      final notificationsPermissionGranted =
          await _flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                  AndroidFlutterLocalNotificationsPlugin>()
              ?.requestNotificationsPermission();
      final exactAlarmsPermissionGranted =
          await _flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                  AndroidFlutterLocalNotificationsPlugin>()
              ?.requestExactAlarmsPermission();
      final androidGranted = (notificationsPermissionGranted ?? false) &&
          (exactAlarmsPermissionGranted ?? false);
      BWMAnalytics.event(
        'pushNotificationsPermissions',
        params: {
          'platform': 'android',
          'granted': androidGranted,
        },
      );
      return androidGranted;
    }
    return false;
  }
}
