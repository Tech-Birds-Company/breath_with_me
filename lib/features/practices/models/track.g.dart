// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrackImpl _$$TrackImplFromJson(Map json) => _$TrackImpl(
      id: json['id'] as String,
      trackFile: json['trackFile'] as String,
      categoryKey: json['categoryKey'] as String,
      duration: json['duration'] as int,
      tutor: Tutor.fromJson(Map<String, dynamic>.from(json['tutor'] as Map)),
      coverIcon: json['coverIcon'] as String,
      language: $enumDecode(_$ContentLanguageEnumMap, json['language'],
          unknownValue: ContentLanguage.unknown),
      animationColor: json['animationColor'] as String?,
      isPremium: json['isPremium'] as bool? ?? false,
      isNew: json['isNew'] as bool? ?? false,
    );

Map<String, dynamic> _$$TrackImplToJson(_$TrackImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'trackFile': instance.trackFile,
      'categoryKey': instance.categoryKey,
      'duration': instance.duration,
      'tutor': instance.tutor,
      'coverIcon': instance.coverIcon,
      'language': _$ContentLanguageEnumMap[instance.language]!,
      'animationColor': instance.animationColor,
      'isPremium': instance.isPremium,
      'isNew': instance.isNew,
    };

const _$ContentLanguageEnumMap = {
  ContentLanguage.ru: 'ru',
  ContentLanguage.en: 'en',
  ContentLanguage.unknown: 'unknown',
};
