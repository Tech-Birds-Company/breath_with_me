import 'package:breathe_with_me/utils/logger.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

abstract final class BWMAnalytics {
  static final _analytics = FirebaseAnalytics.instance;

  static Future<void> _logEvent(
    String event, {
    Map<String, Object?>? params,
  }) async {
    if (await _analytics.isSupported()) {
      await _analytics.logEvent(name: event, parameters: params);
      logger.d('Firebase Analytics event: $event, params: $params');
    }
  }

  static Future<void> logScreenView(String screenClass) async {
    await _analytics.logScreenView(
      screenClass: screenClass,
      screenName: screenClass,
    );
    logger.d('Firebase Analytics screen: $screenClass');
  }

  static void event(
    String event, {
    Map<String, String>? params,
  }) =>
      _logEvent(
        event,
        params: params,
      );
}
