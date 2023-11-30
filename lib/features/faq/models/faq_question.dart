import 'package:breathe_with_me/utils/content_language.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'faq_question.freezed.dart';
part 'faq_question.g.dart';

@freezed
class FaqQuestion with _$FaqQuestion {
  const factory FaqQuestion({
    required int id,
    required String title,
    required String description,
    @JsonKey(unknownEnumValue: ContentLanguage.unknown)
    required ContentLanguage language,
  }) = _FaqQuestion;

  factory FaqQuestion.fromJson(Map<String, dynamic> json) =>
      _$FaqQuestionFromJson(json);
}
