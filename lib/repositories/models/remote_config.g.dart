// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RemoteConfigImpl _$$RemoteConfigImplFromJson(Map json) => _$RemoteConfigImpl(
      socials: json['socials'] == null
          ? RemoteConfigSocials.defaultSocials
          : RemoteConfigSocials.fromJson(
              Map<String, dynamic>.from(json['socials'] as Map)),
    );

Map<String, dynamic> _$$RemoteConfigImplToJson(_$RemoteConfigImpl instance) =>
    <String, dynamic>{
      'socials': instance.socials,
    };
