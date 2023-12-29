// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'streak_statistics_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StreakStatisticsDataImpl _$$StreakStatisticsDataImplFromJson(Map json) =>
    _$StreakStatisticsDataImpl(
      streaksCount: json['streaksCount'] as int? ?? 0,
      practicesCount: json['practicesCount'] as int?,
      minutesCount: json['minutesCount'] as int?,
      dayMissedCount: json['dayMissedCount'] as int?,
    );

Map<String, dynamic> _$$StreakStatisticsDataImplToJson(
        _$StreakStatisticsDataImpl instance) =>
    <String, dynamic>{
      'streaksCount': instance.streaksCount,
      'practicesCount': instance.practicesCount,
      'minutesCount': instance.minutesCount,
      'dayMissedCount': instance.dayMissedCount,
    };
