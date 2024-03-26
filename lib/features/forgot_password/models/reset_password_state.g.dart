// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResetPasswordStateImpl _$$ResetPasswordStateImplFromJson(Map json) =>
    _$ResetPasswordStateImpl(
      oodCode: json['oodCode'] as String,
      password: json['password'] as String? ?? '',
      confirmPassword: json['confirmPassword'] as String? ?? '',
    );

Map<String, dynamic> _$$ResetPasswordStateImplToJson(
        _$ResetPasswordStateImpl instance) =>
    <String, dynamic>{
      'oodCode': instance.oodCode,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
    };
