// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_config_premium.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteConfigPremium _$RemoteConfigPremiumFromJson(Map json) =>
    RemoteConfigPremium(
      premiumBannerTracksPosition:
          json['premiumBannerTracksPosition'] as int? ?? 0,
      premiumBannerTracksEnabled:
          json['premiumBannerTracksEnabled'] as bool? ?? false,
      premiumLandingEnabled: json['premiumLandingEnabled'] as bool? ?? false,
      premiumLandingUrl: json['premiumLandingUrl'] as String? ?? '',
      paywall: json['paywall'] == null
          ? const RemoteConfigPremiumPaywall()
          : RemoteConfigPremiumPaywall.fromJson(
              Map<String, dynamic>.from(json['paywall'] as Map)),
    );
