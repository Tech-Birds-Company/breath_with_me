// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'streak_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StreakStateImpl _$$StreakStateImplFromJson(Map json) => _$StreakStateImpl(
      json['progress'] == null
          ? null
          : StreaksProgress.fromJson(
              Map<String, dynamic>.from(json['progress'] as Map)),
      StreakContentState.fromJson(
          Map<String, dynamic>.from(json['contentState'] as Map)),
    );

Map<String, dynamic> _$$StreakStateImplToJson(_$StreakStateImpl instance) =>
    <String, dynamic>{
      'progress': instance.progress?.toJson(),
      'contentState': instance.contentState.toJson(),
    };
