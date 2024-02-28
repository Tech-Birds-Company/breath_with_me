import 'package:firebase_analytics/firebase_analytics.dart';

abstract final class BWMAnalytics {
  static final _analytics = FirebaseAnalytics.instance;

  static Future<void> _logEvent(
    String event, {
    Map<String, Object?>? params,
  }) async {
    if (await _analytics.isSupported()) {
      await _analytics.logEvent(name: event, parameters: params);
    }
  }

  static void logScreenView(String screenClass) => _analytics.logScreenView(
        screenClass: screenClass,
        screenName: screenClass,
      );

  static void event(
    String event, {
    Map<String, Object?>? params,
  }) =>
      _logEvent(
        event,
        params: params,
      );
}
