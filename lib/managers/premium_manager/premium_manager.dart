import 'package:breathe_with_me/managers/subscriptions_manager/subscriptions_manager.dart';

final class PremiumManager {
  final SubscriptionsManager _subscriptionsManager;

  const PremiumManager(this._subscriptionsManager);

  Stream<bool> get isPremiumUserStream =>
      _subscriptionsManager.isUserPremiumStream;

  bool get isUserPremium =>
      _subscriptionsManager.customerInfo?.entitlements.active.isNotEmpty ??
      false;

  String? get premiumEndDate {
    if (isUserPremium) {
      return _subscriptionsManager
          .customerInfo?.entitlements.active.values.firstOrNull?.expirationDate;
    }
    return null;
  }
}
