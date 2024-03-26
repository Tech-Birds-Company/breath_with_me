import 'dart:io';

import 'package:breathe_with_me/managers/subscriptions_manager/subscriptions_manager.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

final class SubscriptionsManagerImpl extends SubscriptionsManager {
  final String _apiKey;

  SubscriptionsManagerImpl(this._apiKey);

  @override
  Future<void> configure() async {
    await Purchases.setLogLevel(LogLevel.debug);
    final configuration = PurchasesConfiguration(_apiKey)
      ..entitlementVerificationMode = EntitlementVerificationMode.informational
      ..shouldShowInAppMessagesAutomatically = true
      ..store = Platform.isIOS ? Store.appStore : Store.playStore;
    await Purchases.configure(configuration);
    await super.configure();
  }
}
