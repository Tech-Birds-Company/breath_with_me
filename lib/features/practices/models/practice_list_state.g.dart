// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'practice_list_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PracticeListStateImpl _$$PracticeListStateImplFromJson(Map json) =>
    _$PracticeListStateImpl(
      tracks: (json['tracks'] as List<dynamic>?)
              ?.map((e) => Track.fromJson(Map<String, dynamic>.from(e as Map)))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$PracticeListStateImplToJson(
        _$PracticeListStateImpl instance) =>
    <String, dynamic>{
      'tracks': instance.tracks,
    };
