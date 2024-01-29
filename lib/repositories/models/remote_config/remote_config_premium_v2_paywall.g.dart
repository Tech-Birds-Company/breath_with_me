// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_config_premium_v2_paywall.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteConfigPremiumV2Paywall _$RemoteConfigPremiumV2PaywallFromJson(Map json) =>
    RemoteConfigPremiumV2Paywall(
      subscriptions: json['subscriptions'] == null
          ? const RemoteConfigPremiumV2PaywallSubscriptions()
          : RemoteConfigPremiumV2PaywallSubscriptions.fromJson(
              Map<String, dynamic>.from(json['subscriptions'] as Map)),
    );
