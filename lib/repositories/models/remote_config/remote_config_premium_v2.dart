import 'package:breathe_with_me/repositories/models/remote_config/remote_config_premium_v2_paywall.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_config_premium_v2.g.dart';

@JsonSerializable(createToJson: false)
class RemoteConfigPremiumV2 {
  final RemoteConfigPremiumV2Paywall paywall;

  const RemoteConfigPremiumV2({
    this.paywall = const RemoteConfigPremiumV2Paywall(),
  });

  factory RemoteConfigPremiumV2.fromJson(Map<String, dynamic> json) =>
      _$RemoteConfigPremiumV2FromJson(json);
}
