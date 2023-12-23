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
      json['streaksCount'] as int,
      StreakQuoteData.fromJson(Map<String, dynamic>.from(json['quote'] as Map)),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$WithoutPremiumImplToJson(
        _$WithoutPremiumImpl instance) =>
    <String, dynamic>{
      'streaksCount': instance.streaksCount,
      'quote': instance.quote.toJson(),
      'runtimeType': instance.$type,
    };

_$PremiumStartedOrContinuedImpl _$$PremiumStartedOrContinuedImplFromJson(
        Map json) =>
    _$PremiumStartedOrContinuedImpl(
      StreakStatisticsData.fromJson(
          Map<String, dynamic>.from(json['statistics'] as Map)),
      json['streaksCount'] as int,
      StreakLivesData.fromJson(
          Map<String, dynamic>.from(json['livesData'] as Map)),
      StreakQuoteData.fromJson(Map<String, dynamic>.from(json['quote'] as Map)),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PremiumStartedOrContinuedImplToJson(
        _$PremiumStartedOrContinuedImpl instance) =>
    <String, dynamic>{
      'statistics': instance.statistics.toJson(),
      'streaksCount': instance.streaksCount,
      'livesData': instance.livesData.toJson(),
      'quote': instance.quote.toJson(),
      'runtimeType': instance.$type,
    };

_$PremiumMissedImpl _$$PremiumMissedImplFromJson(Map json) =>
    _$PremiumMissedImpl(
      StreakStatisticsData.fromJson(
          Map<String, dynamic>.from(json['statistics'] as Map)),
      StreakLivesData.fromJson(
          Map<String, dynamic>.from(json['livesData'] as Map)),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PremiumMissedImplToJson(_$PremiumMissedImpl instance) =>
    <String, dynamic>{
      'statistics': instance.statistics.toJson(),
      'livesData': instance.livesData.toJson(),
      'runtimeType': instance.$type,
    };
