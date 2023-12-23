// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignUpStateImpl _$$SignUpStateImplFromJson(Map json) => _$SignUpStateImpl(
      error: $enumDecodeNullable(_$SignUpErrorEnumMap, json['error']) ??
          SignUpError.none,
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      password: json['password'] as String? ?? '',
      passwordConfirm: json['passwordConfirm'] as String? ?? '',
      firebaseError: json['firebaseError'] as String?,
    );

Map<String, dynamic> _$$SignUpStateImplToJson(_$SignUpStateImpl instance) =>
    <String, dynamic>{
      'error': _$SignUpErrorEnumMap[instance.error]!,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'passwordConfirm': instance.passwordConfirm,
      'firebaseError': instance.firebaseError,
    };

const _$SignUpErrorEnumMap = {
  SignUpError.emptyName: 'emptyName',
  SignUpError.invalidEmail: 'invalidEmail',
  SignUpError.passwordMismatch: 'passwordMismatch',
  SignUpError.firebaseError: 'firebaseError',
  SignUpError.none: 'none',
};
