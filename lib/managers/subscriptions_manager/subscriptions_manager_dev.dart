import 'package:breathe_with_me/managers/subscriptions_manager/subscriptions_manager.dart';
import 'package:qonversion_flutter/qonversion_flutter.dart';

final class SubscriptionsManagerDev
    implements SubscriptionsManager<QProduct, QEntitlement> {
  late final Qonversion _qonversion;

  @override
  void init() => _qonversion = Qonversion.initialize(
        QonversionConfig(
          '4cbXT9_l8BzrWmpRVski_n3h2O4FOVl6',
          QLaunchMode.subscriptionManagement,
          QEnvironment.sandbox,
          QEntitlementsCacheLifetime.month,
          null,
          false,
        ),
      );

  @override
  Future<Map<String, QProduct>> getProducts() => _qonversion.products();

  @override
  Future<Map<String, QEntitlement>> getEntitlements() =>
      _qonversion.checkEntitlements();

  @override
  Stream<Map<String, QEntitlement>> get entitlementsStream =>
      _qonversion.updatedEntitlementsStream;

  @override
  Future<Map<String, QEntitlement>> purchase(String productId) =>
      _qonversion.purchase(productId);
}
