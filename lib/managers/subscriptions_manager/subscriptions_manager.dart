import 'dart:async';

import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:rxdart/rxdart.dart';

abstract base class SubscriptionsManager {
  late BehaviorSubject<CustomerInfo?> _customerInfoStreamController;

  @mustBeOverridden
  @mustCallSuper
  Future<void> configure() async {
    try {
      final customerInfo = await Purchases.getCustomerInfo();
      _customerInfoStreamController = BehaviorSubject.seeded(customerInfo);
    } on PlatformException {
      _customerInfoStreamController = BehaviorSubject.seeded(null);
    } finally {
      Purchases.addCustomerInfoUpdateListener(_onCustomerInfoUpdated);
    }
  }

  CustomerInfo? get customerInfo => _customerInfoStreamController.value;

  bool get premiumEnabled {
    if (customerInfo == null) {
      Purchases.getCustomerInfo().then(_onCustomerInfoUpdated);
      return false;
    }
    return customerInfo!.activeSubscriptions.isNotEmpty;
  }

  Stream<bool> get premiumEnabledStream => _customerInfoStreamController.stream
      .map((info) => info?.activeSubscriptions.isNotEmpty ?? false)
      .distinct()
      .asBroadcastStream();

  Future<LogInResult> login(String userId) => Purchases.logIn(userId);

  Future<void> logOut() async {
    _customerInfoStreamController.add(null);
    final isAnonymous = await Purchases.isAnonymous;
    if (isAnonymous) {
      return;
    }
    await Purchases.logOut();
  }

  Future<Map<String, StoreProduct>> getProducts(
    List<String> productIdentifiers,
  ) async {
    final products = await Purchases.getProducts(productIdentifiers);
    return {for (final product in products) product.identifier: product};
  }

  Future<CustomerInfo> purchase(StoreProduct product) async {
    final info = await Purchases.purchaseStoreProduct(product);
    await _syncPurchases();
    return info;
  }

  Future<void> _syncPurchases() => Purchases.syncPurchases();

  void _onCustomerInfoUpdated(CustomerInfo info) =>
      _customerInfoStreamController.add(info);

  void dispose() {
    Purchases.removeCustomerInfoUpdateListener(_onCustomerInfoUpdated);
    _customerInfoStreamController.close();
  }
}
