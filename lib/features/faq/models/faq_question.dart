import 'package:breathe_with_me/features/faq/models/faq_language.dart';
import 'package:json_annotation/json_annotation.dart';

part 'faq_question.g.dart';

@JsonSerializable()
class FaqQuestion {
  final int id;
  final String title;
  final String description;
  final FaqLanguage language;

  FaqQuestion({
    required this.id,
    required this.title,
    required this.description,
    @JsonKey(unknownEnumValue: FaqLanguage.unknown) required this.language,
  });

  factory FaqQuestion.fromJson(Map<String, dynamic> json) =>
      _$FaqQuestionFromJson(json);

  Map<String, dynamic> toJson() => _$FaqQuestionToJson(this);
}
