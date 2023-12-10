import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final class PermissionsManager {
  late final _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> handleAppTracking() async {
    final status = await AppTrackingTransparency.trackingAuthorizationStatus;
    if (status != TrackingStatus.notSupported) {
      await AppTrackingTransparency.requestTrackingAuthorization();
    }
  }

  Future<bool?> requestPushNotificationsPermissions() async {
    if (Platform.isIOS) {
      return _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
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
      return (notificationsPermissionGranted ?? false) &&
          (exactAlarmsPermissionGranted ?? false);
    }
    return null;
  }
}
