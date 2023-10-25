// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_player_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrackPlayerStateImpl _$$TrackPlayerStateImplFromJson(Map json) =>
    _$TrackPlayerStateImpl(
      isPaused: json['isPaused'] as bool? ?? true,
      downloadProgress: (json['downloadProgress'] as num?)?.toDouble() ?? 0,
      currentTimeMs: json['currentTimeMs'] as int?,
      estimatedTimeMs: json['estimatedTimeMs'] as int?,
      progress: (json['progress'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$TrackPlayerStateImplToJson(
        _$TrackPlayerStateImpl instance) =>
    <String, dynamic>{
      'isPaused': instance.isPaused,
      'downloadProgress': instance.downloadProgress,
      'currentTimeMs': instance.currentTimeMs,
      'estimatedTimeMs': instance.estimatedTimeMs,
      'progress': instance.progress,
    };
