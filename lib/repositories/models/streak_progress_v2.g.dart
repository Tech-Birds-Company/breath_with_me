// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'streak_progress_v2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StreakProgressV2Impl _$$StreakProgressV2ImplFromJson(Map json) =>
    _$StreakProgressV2Impl(
      totalStreak: json['totalStreak'] as int? ?? 0,
      totalPractices: json['totalPractices'] as int? ?? 0,
      totalLives: json['totalLives'] as int? ?? 0,
      totalMinutes: json['totalMinutes'] as int? ?? 0,
      totalMissedDays: json['totalMissedDays'] as int? ?? 0,
      utcTimeline: (json['utcTimeline'] as List<dynamic>?)
              ?.map((e) => DateTime.parse(e as String))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$StreakProgressV2ImplToJson(
        _$StreakProgressV2Impl instance) =>
    <String, dynamic>{
      'totalStreak': instance.totalStreak,
      'totalPractices': instance.totalPractices,
      'totalLives': instance.totalLives,
      'totalMinutes': instance.totalMinutes,
      'totalMissedDays': instance.totalMissedDays,
      'utcTimeline':
          instance.utcTimeline.map((e) => e.toIso8601String()).toList(),
    };
