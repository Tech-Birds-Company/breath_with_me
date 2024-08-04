// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_config_base_premium.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteConfigBasePremium _$RemoteConfigBasePremiumFromJson(Map json) =>
    RemoteConfigBasePremium(
      ios: BasePremiumPlatform.fromJson(
          Map<String, dynamic>.from(json['ios'] as Map)),
      android: BasePremiumPlatform.fromJson(
          Map<String, dynamic>.from(json['android'] as Map)),
    );

Map<String, dynamic> _$RemoteConfigBasePremiumToJson(
        RemoteConfigBasePremium instance) =>
    <String, dynamic>{
      'ios': instance.ios.toJson(),
      'android': instance.android.toJson(),
    };

BasePremiumPlatform _$BasePremiumPlatformFromJson(Map json) =>
    BasePremiumPlatform(
      annualIdentifier: json['12_months_identifier'] as String,
      threeMonthsIdentfier: json['3_months_identfier'] as String,
    );

Map<String, dynamic> _$BasePremiumPlatformToJson(
        BasePremiumPlatform instance) =>
    <String, dynamic>{
      '12_months_identifier': instance.annualIdentifier,
      '3_months_identfier': instance.threeMonthsIdentfier,
    };
