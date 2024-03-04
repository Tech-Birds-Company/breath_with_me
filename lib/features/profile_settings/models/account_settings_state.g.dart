// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_settings_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountSettingsStateImpl _$$AccountSettingsStateImplFromJson(Map json) =>
    _$AccountSettingsStateImpl(
      name: json['name'] as String,
      email: json['email'] as String,
      isForgotPasswordButtonEnabled:
          json['isForgotPasswordButtonEnabled'] as bool? ?? false,
    );

Map<String, dynamic> _$$AccountSettingsStateImplToJson(
        _$AccountSettingsStateImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'isForgotPasswordButtonEnabled': instance.isForgotPasswordButtonEnabled,
    };
