// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProgressImpl _$$UserProgressImplFromJson(Map json) => _$UserProgressImpl(
      streakDaysCompleted: json['streakDaysCompleted'] as int,
      streakLastTimestamp:
          DateTime.parse(json['streakLastTimestamp'] as String),
      streakTimestamps: (json['streakTimestamps'] as List<dynamic>)
          .map((e) => DateTime.parse(e as String))
          .toList(),
    );

Map<String, dynamic> _$$UserProgressImplToJson(_$UserProgressImpl instance) =>
    <String, dynamic>{
      'streakDaysCompleted': instance.streakDaysCompleted,
      'streakLastTimestamp': instance.streakLastTimestamp.toIso8601String(),
      'streakTimestamps':
          instance.streakTimestamps.map((e) => e.toIso8601String()).toList(),
    };
