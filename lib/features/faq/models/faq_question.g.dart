// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FaqQuestionImpl _$$FaqQuestionImplFromJson(Map json) => _$FaqQuestionImpl(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      language: $enumDecode(_$FaqLanguageEnumMap, json['language'],
          unknownValue: FaqLanguage.unknown),
    );

Map<String, dynamic> _$$FaqQuestionImplToJson(_$FaqQuestionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'language': _$FaqLanguageEnumMap[instance.language]!,
    };

const _$FaqLanguageEnumMap = {
  FaqLanguage.ru: 'ru',
  FaqLanguage.en: 'en',
  FaqLanguage.unknown: 'unknown',
};
