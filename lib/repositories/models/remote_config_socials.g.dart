// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_config_socials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteConfigSocials _$RemoteConfigSocialsFromJson(Map json) =>
    RemoteConfigSocials(
      communityDeeplink: json['communityDeeplink'] as String? ??
          'tg://join?invite=2cWPyTpInQVlN2Ji',
      communityUrl:
          json['communityUrl'] as String? ?? 'https://t.me/+2cWPyTpInQVlN2Ji',
      supportEmailDeeplink: json['supportEmailDeeplink'] as String? ??
          'mailto:support@breathewithme.app',
    );

Map<String, dynamic> _$RemoteConfigSocialsToJson(
        RemoteConfigSocials instance) =>
    <String, dynamic>{
      'communityDeeplink': instance.communityDeeplink,
      'communityUrl': instance.communityUrl,
      'supportEmailDeeplink': instance.supportEmailDeeplink,
    };
