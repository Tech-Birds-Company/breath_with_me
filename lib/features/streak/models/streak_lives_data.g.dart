// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'streak_lives_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StreakLivesDataImpl _$$StreakLivesDataImplFromJson(Map json) =>
    _$StreakLivesDataImpl(
      availableLivesCount: json['availableLivesCount'] as int,
      totalLivesCount: json['totalLivesCount'] as int,
      showTitle: json['showTitle'] as bool,
      showFooter: json['showFooter'] as bool,
    );

Map<String, dynamic> _$$StreakLivesDataImplToJson(
        _$StreakLivesDataImpl instance) =>
    <String, dynamic>{
      'availableLivesCount': instance.availableLivesCount,
      'totalLivesCount': instance.totalLivesCount,
      'showTitle': instance.showTitle,
      'showFooter': instance.showFooter,
    };
