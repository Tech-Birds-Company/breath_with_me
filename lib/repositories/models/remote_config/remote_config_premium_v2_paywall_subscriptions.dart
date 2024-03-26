import 'package:json_annotation/json_annotation.dart';

part 'remote_config_premium_v2_paywall_subscriptions.g.dart';

@JsonSerializable(createToJson: false)
class RemoteConfigPremiumV2PaywallSubscriptions {
  final List<String> android;
  final List<String> ios;

  const RemoteConfigPremiumV2PaywallSubscriptions({
    this.android = const <String>[],
    this.ios = const <String>[],
  });

  factory RemoteConfigPremiumV2PaywallSubscriptions.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$RemoteConfigPremiumV2PaywallSubscriptionsFromJson(json);
}
