import 'package:app_tracking_transparency/app_tracking_transparency.dart';

final class PermissionsManager {
  Future<void> handleAppTracking() async {
    final status = await AppTrackingTransparency.trackingAuthorizationStatus;
    if (status != TrackingStatus.notSupported) {
      await AppTrackingTransparency.requestTrackingAuthorization();
    }
  }
}
