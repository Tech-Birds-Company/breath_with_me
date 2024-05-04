// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'streak_progress_v2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StreakProgressV2Impl _$$StreakProgressV2ImplFromJson(Map json) =>
    _$StreakProgressV2Impl(
      totalStreak: (json['totalStreak'] as num?)?.toInt() ?? 0,
      totalPractices: (json['totalPractices'] as num?)?.toInt() ?? 0,
      totalLives: (json['totalLives'] as num?)?.toInt() ?? 0,
      totalMinutes: (json['totalMinutes'] as num?)?.toInt() ?? 0,
      totalMissedDays: (json['totalMissedDays'] as num?)?.toInt() ?? 0,
      utcTimeline: (json['utcTimeline'] as List<dynamic>?)
              ?.map((e) => DateTime.parse(e as String))
              .toList() ??
          const [],
      utcLivesExpireDateTime: json['utcLivesExpireDateTime'] == null
          ? null
          : DateTime.parse(json['utcLivesExpireDateTime'] as String),
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
      'utcLivesExpireDateTime':
          instance.utcLivesExpireDateTime?.toIso8601String(),
    };
