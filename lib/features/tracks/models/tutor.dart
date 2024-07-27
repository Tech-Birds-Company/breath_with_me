import 'package:json_annotation/json_annotation.dart';

part 'tutor.g.dart';

@JsonSerializable()
class Tutor {
  final String id;
  final String tutorNameKey;
  final String avatarUrl;
  final Map<String, String>? tutorNameTranslations;

  const Tutor({
    required this.id,
    required this.tutorNameKey,
    required this.avatarUrl,
    this.tutorNameTranslations,
  });

  String? tutorTranslatedName(String language) =>
      tutorNameTranslations?[language];

  factory Tutor.fromJson(Map<String, dynamic> json) => _$TutorFromJson(json);

  Map<String, dynamic> toJson() => _$TutorToJson(this);
}
