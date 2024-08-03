// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrackImpl _$$TrackImplFromJson(Map json) => _$TrackImpl(
      id: json['id'] as String,
      trackFile: json['trackFile'] as String,
      categoryKey: json['categoryKey'] as String,
      duration: (json['duration'] as num).toInt(),
      tutor: Tutor.fromJson(Map<String, dynamic>.from(json['tutor'] as Map)),
      coverIcon: json['coverIcon'] as String,
      language: $enumDecode(_$TrackLanguageEnumMap, json['language'],
          unknownValue: TrackLanguage.unknown),
      isPremium: json['isPremium'] as bool? ?? false,
      animationColor: json['animationColor'] as String?,
      artist: json['artist'] as String?,
      trackName: json['trackName'] as String?,
      trackTitleTranslations: (json['trackTitleTranslations'] as Map?)?.map(
        (k, e) => MapEntry(k as String, e as String),
      ),
    );

Map<String, dynamic> _$$TrackImplToJson(_$TrackImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'trackFile': instance.trackFile,
      'categoryKey': instance.categoryKey,
      'duration': instance.duration,
      'tutor': instance.tutor.toJson(),
      'coverIcon': instance.coverIcon,
      'language': _$TrackLanguageEnumMap[instance.language]!,
      'isPremium': instance.isPremium,
      'animationColor': instance.animationColor,
      'artist': instance.artist,
      'trackName': instance.trackName,
      'trackTitleTranslations': instance.trackTitleTranslations,
    };

const _$TrackLanguageEnumMap = {
  TrackLanguage.ru: 'ru',
  TrackLanguage.en: 'en',
  TrackLanguage.unknown: 'unknown',
};
