// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'streak_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StreakStateImpl _$$StreakStateImplFromJson(Map json) => _$StreakStateImpl(
      selectedDay: json['selectedDay'] as int?,
      statistics: json['statistics'] == null
          ? null
          : StreakStatisticsData.fromJson(
              Map<String, dynamic>.from(json['statistics'] as Map)),
      quote: json['quote'] == null
          ? null
          : StreakQuoteData.fromJson(
              Map<String, dynamic>.from(json['quote'] as Map)),
    );

Map<String, dynamic> _$$StreakStateImplToJson(_$StreakStateImpl instance) =>
    <String, dynamic>{
      'selectedDay': instance.selectedDay,
      'statistics': instance.statistics?.toJson(),
      'quote': instance.quote?.toJson(),
    };
