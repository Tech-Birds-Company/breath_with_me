// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'streak_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoadingImpl _$$LoadingImplFromJson(Map json) => _$LoadingImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LoadingImplToJson(_$LoadingImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$WithoutProImpl _$$WithoutProImplFromJson(Map json) => _$WithoutProImpl(
      json['selectedDay'] as int,
      StreakQuoteData.fromJson(Map<String, dynamic>.from(json['quote'] as Map)),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$WithoutProImplToJson(_$WithoutProImpl instance) =>
    <String, dynamic>{
      'selectedDay': instance.selectedDay,
      'quote': instance.quote.toJson(),
      'runtimeType': instance.$type,
    };

_$StartedOrContinuedImpl _$$StartedOrContinuedImplFromJson(Map json) =>
    _$StartedOrContinuedImpl(
      json['selectedDay'] as int?,
      StreakStatisticsData.fromJson(
          Map<String, dynamic>.from(json['statistics'] as Map)),
      StreakQuoteData.fromJson(Map<String, dynamic>.from(json['quote'] as Map)),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$StartedOrContinuedImplToJson(
        _$StartedOrContinuedImpl instance) =>
    <String, dynamic>{
      'selectedDay': instance.selectedDay,
      'statistics': instance.statistics.toJson(),
      'quote': instance.quote.toJson(),
      'runtimeType': instance.$type,
    };

_$MissedImpl _$$MissedImplFromJson(Map json) => _$MissedImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$MissedImplToJson(_$MissedImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
