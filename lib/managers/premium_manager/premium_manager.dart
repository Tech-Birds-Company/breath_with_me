import 'dart:async';
import 'dart:io';

import 'package:breathe_with_me/constants.dart';
import 'package:breathe_with_me/repositories/firebase_premium_repository.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:rxdart/rxdart.dart';

final class PremiumManager {
  final FirebasePremiumRepository _firebasePremiumRepository;

  PremiumManager(this._firebasePremiumRepository);

  BehaviorSubject<bool>? _revenueCatIsPremiumStreamController;

  Future<void> init({required bool isProduction}) async {
    if (!isProduction) {
      await Purchases.setLogLevel(LogLevel.verbose);
    }
    final apiKey = isProduction
        ? (Platform.isIOS
            ? BWMConstants.revenueCatApiKeyiOSProd
            : BWMConstants.revenueCatApiKeyAndroidProd)
        : (Platform.isIOS
            ? BWMConstants.revenueCatApiKeyiOSDev
            : BWMConstants.revenueCatApiKeyAndroidDev);

    final configuration = PurchasesConfiguration(apiKey);
    await Purchases.configure(configuration);
    await initSubscriptions();
  }

  Future<void> initSubscriptions() async {
    if (_revenueCatIsPremiumStreamController == null) {
      final customerInfo = await Purchases.getCustomerInfo();
      _revenueCatIsPremiumStreamController =
          BehaviorSubject.seeded(customerInfo.activeSubscriptions.isNotEmpty);
    }

    Purchases.removeCustomerInfoUpdateListener(_customerInfoUpdateListener);
    Purchases.addCustomerInfoUpdateListener(_customerInfoUpdateListener);
  }

  Stream<bool> isPremiumUserStream(String userId) {
    final firebase = _firebasePremiumRepository.isPremiumEnabledStream(userId);
    return Rx.combineLatest2(
      firebase,
      _revenueCatIsPremiumStreamController?.stream ?? Stream.value(false),
      (firebase, revenueCat) => firebase || revenueCat,
    );
  }

  void _customerInfoUpdateListener(CustomerInfo customerInfo) {
    _revenueCatIsPremiumStreamController
        ?.add(customerInfo.activeSubscriptions.isNotEmpty);
  }

  Future<bool> isUserPremium(String userId) async {
    final customerInfo = await Purchases.getCustomerInfo();

    final firebase = await _firebasePremiumRepository.isPremiumEnabled(userId);
    final revenueCat = customerInfo.activeSubscriptions.isNotEmpty;

    return revenueCat || firebase;
  }

  void dispose() {
    Purchases.removeCustomerInfoUpdateListener(_customerInfoUpdateListener);
    _revenueCatIsPremiumStreamController?.close();
    _revenueCatIsPremiumStreamController = null;
  }
}
