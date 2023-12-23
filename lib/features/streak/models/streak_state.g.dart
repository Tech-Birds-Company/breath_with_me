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

_$WithoutPremiumImpl _$$WithoutPremiumImplFromJson(Map json) =>
    _$WithoutPremiumImpl(
      json['selectedDay'] as int,
      StreakQuoteData.fromJson(Map<String, dynamic>.from(json['quote'] as Map)),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$WithoutPremiumImplToJson(
        _$WithoutPremiumImpl instance) =>
    <String, dynamic>{
      'selectedDay': instance.selectedDay,
      'quote': instance.quote.toJson(),
      'runtimeType': instance.$type,
    };

_$PremiumStartedOrContinuedImpl _$$PremiumStartedOrContinuedImplFromJson(
        Map json) =>
    _$PremiumStartedOrContinuedImpl(
      json['selectedDay'] as int,
      StreakStatisticsData.fromJson(
          Map<String, dynamic>.from(json['statistics'] as Map)),
      StreakQuoteData.fromJson(Map<String, dynamic>.from(json['quote'] as Map)),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PremiumStartedOrContinuedImplToJson(
        _$PremiumStartedOrContinuedImpl instance) =>
    <String, dynamic>{
      'selectedDay': instance.selectedDay,
      'statistics': instance.statistics.toJson(),
      'quote': instance.quote.toJson(),
      'runtimeType': instance.$type,
    };

_$PremiumMissedImpl _$$PremiumMissedImplFromJson(Map json) =>
    _$PremiumMissedImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PremiumMissedImplToJson(_$PremiumMissedImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
