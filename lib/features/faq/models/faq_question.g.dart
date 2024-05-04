// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FaqQuestion _$FaqQuestionFromJson(Map json) => FaqQuestion(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      language: $enumDecode(_$FaqLanguageEnumMap, json['language']),
    );

Map<String, dynamic> _$FaqQuestionToJson(FaqQuestion instance) =>
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
