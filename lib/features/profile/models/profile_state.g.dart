// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileStateImpl _$$ProfileStateImplFromJson(Map json) => _$ProfileStateImpl(
      json['statistics'] == null
          ? null
          : StreakStatisticsData.fromJson(
              Map<String, dynamic>.from(json['statistics'] as Map)),
    );

Map<String, dynamic> _$$ProfileStateImplToJson(_$ProfileStateImpl instance) =>
    <String, dynamic>{
      'statistics': instance.statistics?.toJson(),
    };
