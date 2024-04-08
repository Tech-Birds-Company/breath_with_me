// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracks_list_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TracksListStateDataImpl _$$TracksListStateDataImplFromJson(Map json) =>
    _$TracksListStateDataImpl(
      (json['tracks'] as List<dynamic>)
          .map((e) => Track.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      filteredTracks: (json['filteredTracks'] as List<dynamic>?)
          ?.map((e) => Track.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TracksListStateDataImplToJson(
        _$TracksListStateDataImpl instance) =>
    <String, dynamic>{
      'tracks': instance.tracks.map((e) => e.toJson()).toList(),
      'filteredTracks':
          instance.filteredTracks?.map((e) => e.toJson()).toList(),
      'runtimeType': instance.$type,
    };

_$TracksListStateLoadingImpl _$$TracksListStateLoadingImplFromJson(Map json) =>
    _$TracksListStateLoadingImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TracksListStateLoadingImplToJson(
        _$TracksListStateLoadingImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$TracksListStateErrorImpl _$$TracksListStateErrorImplFromJson(Map json) =>
    _$TracksListStateErrorImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TracksListStateErrorImplToJson(
        _$TracksListStateErrorImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
