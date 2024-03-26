// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'streak_statistics_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FullImpl _$$FullImplFromJson(Map json) => _$FullImpl(
      json['streaksCount'] as int,
      json['practicesCount'] as int,
      json['minutesCount'] as int,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$FullImplToJson(_$FullImpl instance) =>
    <String, dynamic>{
      'streaksCount': instance.streaksCount,
      'practicesCount': instance.practicesCount,
      'minutesCount': instance.minutesCount,
      'runtimeType': instance.$type,
    };

_$MissedImpl _$$MissedImplFromJson(Map json) => _$MissedImpl(
      json['streaksCount'] as int,
      json['missedDaysCount'] as int,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$MissedImplToJson(_$MissedImpl instance) =>
    <String, dynamic>{
      'streaksCount': instance.streaksCount,
      'missedDaysCount': instance.missedDaysCount,
      'runtimeType': instance.$type,
    };
