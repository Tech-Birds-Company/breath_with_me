import 'package:breathe_with_me/features/practices/models/track.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'faq_question.freezed.dart';
part 'faq_question.g.dart';

@freezed
class FaqQuestion with _$FaqQuestion {
  const factory FaqQuestion({
    required int id,
    required String title,
    required String description,
    required TrackLanguage language,
  }) = _FaqQuestion;

  factory FaqQuestion.fromJson(Map<String, dynamic> json) =>
      _$FaqQuestionFromJson(json);
}
