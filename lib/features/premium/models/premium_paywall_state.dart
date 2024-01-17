import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qonversion_flutter/qonversion_flutter.dart';

part 'premium_paywall_state.freezed.dart';

@freezed
class PremiumPaywallState with _$PremiumPaywallState {
  const factory PremiumPaywallState.data({
    required Map<String, QProduct> subscriptions,
    String? selectedSubscriptionId,
    @Default(false) bool premiumPurchaseProcessing,
  }) = _PremiumPaywallData;

  const factory PremiumPaywallState.loading() = _PremiumPaywallLoading;

  const factory PremiumPaywallState.error() = _PremiumPaywallError;
}
