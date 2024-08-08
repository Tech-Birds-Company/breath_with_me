import 'dart:io';

import 'package:breathe_with_me/features/premium/models/premium_paywall_state.dart';
import 'package:breathe_with_me/managers/deeplink_manager/deeplink_manager.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/managers/user_manager/user_manager.dart';
import 'package:breathe_with_me/repositories/remote_config_repository.dart';
import 'package:breathe_with_me/utils/analytics/bwm_analytics.dart';
import 'package:breathe_with_me/utils/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

final class PremiumPaywallBloc extends BlocBase<PremiumPaywallState> {
  final RemoteConfigRepository _remoteConfigRepository;
  final UserManager _userManager;
  final DeeplinkManager _deeplinkManager;
  final NavigationManager _navigationManager;

  PremiumPaywallBloc(
    this._remoteConfigRepository,
    this._userManager,
    this._deeplinkManager,
    this._navigationManager,
  ) : super(const PremiumPaywallState());

  Future<void> init() async {
    final premiumProducts = Platform.isIOS
        ? _remoteConfigRepository.basePremium.ios
        : _remoteConfigRepository.basePremium.android;

    late List<String> identifiers;

    if (Platform.isIOS) {
      identifiers = [
        premiumProducts.annualIdentifier,
        premiumProducts.threeMonthsIdentfier,
      ];
    } else {
      identifiers = [
        premiumProducts.annualIdentifier.split(':').first,
        premiumProducts.threeMonthsIdentfier.split(':').first,
      ];
    }

    final res = await Purchases.getProducts(identifiers);
    BWMAnalytics.event(
      'premium_products_loaded',
      params: {
        'products': identifiers.join(','),
      },
    );

    emit(
      state.copyWith(
        storeProducts: {
          premiumProducts.annualIdentifier: res
              .where((p) => p.identifier == premiumProducts.annualIdentifier)
              .firstOrNull,
          premiumProducts.threeMonthsIdentfier: res
              .where(
                (p) => p.identifier == premiumProducts.threeMonthsIdentfier,
              )
              .firstOrNull,
        },
      ),
    );
  }

  void onSubscriptionSelected(String id) {
    emit(
      state.copyWith(
        selectedSubscriptionId: id,
      ),
    );
    BWMAnalytics.event(
      'premium_subscription_selected',
      params: {
        'id': id,
      },
    );
  }

  Future<void> onBuyPremium() async {
    final product = state.storeProducts[state.selectedSubscriptionId];
    if (product == null) return;
    try {
      emit(state.copyWith(premiumPurchaseProcessing: true));
      await Purchases.purchaseStoreProduct(product);
      BWMAnalytics.event(
        'premium_purchased',
        params: {
          'id': product.identifier,
          'user_id': _userManager.currentUser?.uid ?? 'unknown',
        },
      );
      _navigationManager.pop();
    } on Object catch (e) {
      logger.e('Error purchasing premium: $e');
      BWMAnalytics.event(
        'premium_purchase_error',
        params: {
          'error': e.toString(),
        },
      );
    } finally {
      emit(state.copyWith(premiumPurchaseProcessing: false));
    }
  }

  Future<void> onOpenPrivacyPolicy() async {
    await _deeplinkManager.onOpenPrivacyPolicy();
  }

  Future<void> onOpenTermsOfService() async {
    await _deeplinkManager.onOpenTermsOfService();
  }

  void onClosePaywall() => _navigationManager.pop();
}
