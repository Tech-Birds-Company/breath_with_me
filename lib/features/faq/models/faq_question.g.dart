// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FaqQuestionImpl _$$FaqQuestionImplFromJson(Map json) => _$FaqQuestionImpl(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      language: $enumDecode(_$TrackLanguageEnumMap, json['language']),
    );

Map<String, dynamic> _$$FaqQuestionImplToJson(_$FaqQuestionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'language': _$TrackLanguageEnumMap[instance.language]!,
    };

const _$TrackLanguageEnumMap = {
  TrackLanguage.ru: 'ru',
  TrackLanguage.en: 'en',
  TrackLanguage.unknown: 'unknown',
};
