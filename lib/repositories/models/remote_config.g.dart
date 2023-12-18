// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteConfig _$RemoteConfigFromJson(Map json) => RemoteConfig(
      socials: json['socials'] == null
          ? const RemoteConfigSocials()
          : RemoteConfigSocials.fromJson(
              Map<String, dynamic>.from(json['socials'] as Map)),
      legalDocuments: json['legal_documents'] == null
          ? const LegalDocuments()
          : LegalDocuments.fromJson(
              Map<String, dynamic>.from(json['legal_documents'] as Map)),
    );

Map<String, dynamic> _$RemoteConfigToJson(RemoteConfig instance) =>
    <String, dynamic>{
      'socials': instance.socials.toJson(),
      'legal_documents': instance.legalDocuments.toJson(),
    };
