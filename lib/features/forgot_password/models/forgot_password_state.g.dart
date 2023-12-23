// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForgotPasswordStateImpl _$$ForgotPasswordStateImplFromJson(Map json) =>
    _$ForgotPasswordStateImpl(
      email: json['email'] as String? ?? '',
      requestSended: json['requestSended'] as bool? ?? false,
    );

Map<String, dynamic> _$$ForgotPasswordStateImplToJson(
        _$ForgotPasswordStateImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'requestSended': instance.requestSended,
    };
