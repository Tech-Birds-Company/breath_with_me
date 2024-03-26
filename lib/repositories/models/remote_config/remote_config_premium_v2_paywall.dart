import 'package:breathe_with_me/repositories/models/remote_config/remote_config_premium_v2_paywall_subscriptions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_config_premium_v2_paywall.g.dart';

@JsonSerializable(createToJson: false)
class RemoteConfigPremiumV2Paywall {
  final RemoteConfigPremiumV2PaywallSubscriptions subscriptions;

  const RemoteConfigPremiumV2Paywall({
    this.subscriptions = const RemoteConfigPremiumV2PaywallSubscriptions(),
  });

  factory RemoteConfigPremiumV2Paywall.fromJson(Map<String, dynamic> json) =>
      _$RemoteConfigPremiumV2PaywallFromJson(json);
}
