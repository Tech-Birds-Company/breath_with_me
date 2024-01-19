import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_config_premium_paywall.g.dart';

@JsonSerializable(createToJson: false)
class RemoteConfigPremiumPaywall {
  final List<String> subscriptions;

  const RemoteConfigPremiumPaywall({this.subscriptions = const []});

  factory RemoteConfigPremiumPaywall.fromJson(Map<String, dynamic> json) =>
      _$RemoteConfigPremiumPaywallFromJson(json);
}
