import 'package:breathe_with_me/repositories/models/remote_config/remote_config_premium_v2_paywall.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_config_premium_v2.g.dart';

@JsonSerializable(createToJson: false)
class RemoteConfigPremiumV2 {
  final bool premiumEnabled;
  final int premiumBannerTracksPosition;
  final bool premiumBannerTracksEnabled;
  final bool premiumLandingEnabled;
  final String premiumLandingUrl;
  final RemoteConfigPremiumV2Paywall paywall;

  const RemoteConfigPremiumV2({
    this.premiumEnabled = false,
    this.premiumBannerTracksPosition = 0,
    this.premiumBannerTracksEnabled = false,
    this.premiumLandingEnabled = false,
    this.premiumLandingUrl = '',
    this.paywall = const RemoteConfigPremiumV2Paywall(),
  });

  factory RemoteConfigPremiumV2.fromJson(Map<String, dynamic> json) =>
      _$RemoteConfigPremiumV2FromJson(json);
}
