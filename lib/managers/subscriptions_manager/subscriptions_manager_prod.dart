import 'package:breathe_with_me/managers/subscriptions_manager/subscriptions_manager.dart';
import 'package:qonversion_flutter/qonversion_flutter.dart';

final class SubscriptionsManagerProd
    implements SubscriptionsManager<QProduct, QEntitlement> {
  late final Qonversion _qonversion;

  @override
  void init() {
    _qonversion = Qonversion.initialize(
      QonversionConfig(
        '2p-CRwvYGLcHR3vYdxdXlvrD7Tp24HB_',
        QLaunchMode.subscriptionManagement,
        QEnvironment.production,
        QEntitlementsCacheLifetime.month,
        null,
        false,
      ),
    );
  }

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
