// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tutor _$TutorFromJson(Map json) => Tutor(
      id: json['id'] as String,
      tutorNameKey: json['tutorNameKey'] as String,
      avatarUrl: json['avatarUrl'] as String,
      tutorNameTranslations: (json['tutorNameTranslations'] as Map?)?.map(
        (k, e) => MapEntry(k as String, e as String),
      ),
    );

Map<String, dynamic> _$TutorToJson(Tutor instance) => <String, dynamic>{
      'id': instance.id,
      'tutorNameKey': instance.tutorNameKey,
      'avatarUrl': instance.avatarUrl,
      'tutorNameTranslations': instance.tutorNameTranslations,
    };
