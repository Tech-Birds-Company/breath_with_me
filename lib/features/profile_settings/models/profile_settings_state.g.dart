// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_settings_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileSettingsStateImpl _$$ProfileSettingsStateImplFromJson(Map json) =>
    _$ProfileSettingsStateImpl(
      name: json['name'] as String,
      email: json['email'] as String,
      isForgotPasswordButtonEnabled:
          json['isForgotPasswordButtonEnabled'] as bool? ?? false,
    );

Map<String, dynamic> _$$ProfileSettingsStateImplToJson(
        _$ProfileSettingsStateImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'isForgotPasswordButtonEnabled': instance.isForgotPasswordButtonEnabled,
    };
