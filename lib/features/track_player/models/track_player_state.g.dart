// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_player_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrackPlayerStateImpl _$$TrackPlayerStateImplFromJson(Map json) =>
    _$TrackPlayerStateImpl(
      isPaused: json['isPaused'] as bool? ?? true,
      progress: (json['progress'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$TrackPlayerStateImplToJson(
        _$TrackPlayerStateImpl instance) =>
    <String, dynamic>{
      'isPaused': instance.isPaused,
      'progress': instance.progress,
    };
