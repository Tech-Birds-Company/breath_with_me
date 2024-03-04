import 'package:breathe_with_me/managers/subscriptions_manager/subscriptions_manager.dart';
import 'package:breathe_with_me/repositories/firebase_remote_config_repository.dart';

final class PremiumManager {
  final FirebaseRemoteConfigRepository _remoteConfigRepository;
  final SubscriptionsManager _subscriptionsManager;

  const PremiumManager(
    this._remoteConfigRepository,
    this._subscriptionsManager,
  );

  bool get _premiumEnabled => _remoteConfigRepository.premiumV2.premiumEnabled;

  bool get premiumContentEnabled => !_premiumEnabled || isUserPremium;

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

  Stream<bool> get isPremiumUserStream =>
      _subscriptionsManager.isUserPremiumStream;
}
