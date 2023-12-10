// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'streak_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StreakStateImpl _$$StreakStateImplFromJson(Map json) => _$StreakStateImpl(
      selectedDay: json['selectedDay'] as int?,
      statisticsData: json['statisticsData'] == null
          ? null
          : StreakStatisticsData.fromJson(
              Map<String, dynamic>.from(json['statisticsData'] as Map)),
    );

Map<String, dynamic> _$$StreakStateImplToJson(_$StreakStateImpl instance) =>
    <String, dynamic>{
      'selectedDay': instance.selectedDay,
      'statisticsData': instance.statisticsData,
    };
