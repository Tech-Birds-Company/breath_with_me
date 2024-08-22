import 'package:json_annotation/json_annotation.dart';

part 'remote_config_base_premium.g.dart';

@JsonSerializable()
class RemoteConfigBasePremium {
  @JsonKey(name: 'ios')
  BasePremiumPlatform ios;
  @JsonKey(name: 'android')
  BasePremiumPlatform android;

  RemoteConfigBasePremium({
    required this.ios,
    required this.android,
  });

  factory RemoteConfigBasePremium.fromJson(Map<String, dynamic> json) =>
      _$RemoteConfigBasePremiumFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteConfigBasePremiumToJson(this);
}

@JsonSerializable()
class BasePremiumPlatform {
  @JsonKey(name: '12_months_identifier')
  String annualIdentifier;
  @JsonKey(name: '3_months_identfier')
  String threeMonthsIdentfier;

  BasePremiumPlatform({
    required this.annualIdentifier,
    required this.threeMonthsIdentfier,
  });

  factory BasePremiumPlatform.fromJson(Map<String, dynamic> json) =>
      _$BasePremiumPlatformFromJson(json);

  Map<String, dynamic> toJson() => _$BasePremiumPlatformToJson(this);
}
