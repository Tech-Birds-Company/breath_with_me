import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:purchases_flutter/models/store_product_wrapper.dart';

part 'premium_paywall_state.freezed.dart';

@freezed
class PremiumPaywallState with _$PremiumPaywallState {
  const factory PremiumPaywallState.data({
    required Map<String, StoreProduct> subscriptions,
    String? selectedSubscriptionId,
    @Default(false) bool premiumPurchaseProcessing,
  }) = PremiumPaywallData;

  const factory PremiumPaywallState.loading() = PremiumPaywallLoading;

  const factory PremiumPaywallState.error() = PremiumPaywallError;
}
