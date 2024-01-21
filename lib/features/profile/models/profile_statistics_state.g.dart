// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_statistics_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmptyImpl _$$EmptyImplFromJson(Map json) => _$EmptyImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$EmptyImplToJson(_$EmptyImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$PremiumOfferImpl _$$PremiumOfferImplFromJson(Map json) => _$PremiumOfferImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PremiumOfferImplToJson(_$PremiumOfferImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$StreakStatisticsImpl _$$StreakStatisticsImplFromJson(Map json) =>
    _$StreakStatisticsImpl(
      StreakStatisticsData.fromJson(
          Map<String, dynamic>.from(json['streakStatistics'] as Map)),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$StreakStatisticsImplToJson(
        _$StreakStatisticsImpl instance) =>
    <String, dynamic>{
      'streakStatistics': instance.streakStatistics.toJson(),
      'runtimeType': instance.$type,
    };
