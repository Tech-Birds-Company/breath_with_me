// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'premium_users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PremiumUsersImpl _$$PremiumUsersImplFromJson(Map json) => _$PremiumUsersImpl(
      userId: json['user_id'] as String,
      enabled: json['enabled'] as bool? ?? false,
      expire: _parseDateTime(json['expire'] as Timestamp?),
    );

Map<String, dynamic> _$$PremiumUsersImplToJson(_$PremiumUsersImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'enabled': instance.enabled,
      'expire': instance.expire?.toIso8601String(),
    };
