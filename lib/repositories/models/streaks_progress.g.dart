// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'streaks_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StreaksProgressImpl _$$StreaksProgressImplFromJson(Map json) =>
    _$StreaksProgressImpl(
      livesCount: json['livesCount'] as int,
      livesExpireTimestamp:
          DateTime.parse(json['livesExpireTimestamp'] as String),
      minutesCount: json['minutesCount'] as int,
      practicesCount: json['practicesCount'] as int,
      timeline: (json['timeline'] as List<dynamic>)
          .map((e) => DateTime.parse(e as String))
          .toList(),
    );

Map<String, dynamic> _$$StreaksProgressImplToJson(
        _$StreaksProgressImpl instance) =>
    <String, dynamic>{
      'livesCount': instance.livesCount,
      'livesExpireTimestamp': instance.livesExpireTimestamp.toIso8601String(),
      'minutesCount': instance.minutesCount,
      'practicesCount': instance.practicesCount,
      'timeline': instance.timeline.map((e) => e.toIso8601String()).toList(),
    };
