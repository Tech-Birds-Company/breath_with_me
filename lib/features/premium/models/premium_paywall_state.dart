import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

part 'premium_paywall_state.freezed.dart';

@freezed
class PremiumPaywallState with _$PremiumPaywallState {
  const factory PremiumPaywallState({
    String? selectedSubscriptionId,
    @Default(<String, StoreProduct?>{})
    Map<String, StoreProduct?> storeProducts,
    @Default(false) bool premiumPurchaseProcessing,
  }) = _PremiumPaywallData;
}
