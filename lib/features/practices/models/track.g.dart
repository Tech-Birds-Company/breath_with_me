// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrackImpl _$$TrackImplFromJson(Map json) => _$TrackImpl(
      id: json['id'] as String,
      trackFile: json['trackFile'] as String,
      title: json['title'] as String,
      duration: json['duration'] as int,
      tutor: Tutor.fromJson(Map<String, dynamic>.from(json['tutor'] as Map)),
      language: $enumDecode(_$TrackLanguageEnumMap, json['language'],
          unknownValue: TrackLanguage.unknown),
      isPremium: json['isPremium'] as bool? ?? false,
      isNew: json['isNew'] as bool? ?? false,
    );

Map<String, dynamic> _$$TrackImplToJson(_$TrackImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'trackFile': instance.trackFile,
      'title': instance.title,
      'duration': instance.duration,
      'tutor': instance.tutor,
      'language': _$TrackLanguageEnumMap[instance.language]!,
      'isPremium': instance.isPremium,
      'isNew': instance.isNew,
    };

const _$TrackLanguageEnumMap = {
  TrackLanguage.ru: 'ru',
  TrackLanguage.en: 'en',
  TrackLanguage.unknown: 'unknown',
};
