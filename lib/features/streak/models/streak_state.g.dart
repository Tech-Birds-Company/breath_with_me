// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'streak_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StreakStateImpl _$$StreakStateImplFromJson(Map json) => _$StreakStateImpl(
      progress: json['progress'] == null
          ? const StreakProgressV2()
          : StreakProgressV2.fromJson(
              Map<String, dynamic>.from(json['progress'] as Map)),
    );

Map<String, dynamic> _$$StreakStateImplToJson(_$StreakStateImpl instance) =>
    <String, dynamic>{
      'progress': instance.progress.toJson(),
    };
