import 'package:breathe_with_me/repositories/models/remote_config/remote_config_premium_paywall.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_config_premium.g.dart';

@JsonSerializable(createToJson: false)
class RemoteConfigPremium {
  final int premiumBannerTracksPosition;
  final bool premiumBannerTracksEnabled;
  final bool premiumLandingEnabled;
  final String premiumLandingUrl;
  final RemoteConfigPremiumPaywall paywall;

  const RemoteConfigPremium({
    this.premiumBannerTracksPosition = 0,
    this.premiumBannerTracksEnabled = false,
    this.premiumLandingEnabled = false,
    this.premiumLandingUrl = '',
    this.paywall = const RemoteConfigPremiumPaywall(),
  });

  factory RemoteConfigPremium.fromJson(Map<String, dynamic> json) =>
      _$RemoteConfigPremiumFromJson(json);
}
