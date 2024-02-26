// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_config_premium_v2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteConfigPremiumV2 _$RemoteConfigPremiumV2FromJson(Map json) =>
    RemoteConfigPremiumV2(
      premiumEnabled: json['premiumEnabled'] as bool? ?? false,
      premiumBannerTracksPosition:
          json['premiumBannerTracksPosition'] as int? ?? 0,
      premiumBannerTracksEnabled:
          json['premiumBannerTracksEnabled'] as bool? ?? false,
      premiumLandingEnabled: json['premiumLandingEnabled'] as bool? ?? false,
      premiumLandingUrl: json['premiumLandingUrl'] as String? ?? '',
      paywall: json['paywall'] == null
          ? const RemoteConfigPremiumV2Paywall()
          : RemoteConfigPremiumV2Paywall.fromJson(
              Map<String, dynamic>.from(json['paywall'] as Map)),
    );
