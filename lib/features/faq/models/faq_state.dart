import 'package:breathe_with_me/features/faq/models/faq_question.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'faq_state.freezed.dart';
part 'faq_state.g.dart';

@freezed
abstract class FaqState with _$FaqState {
  const factory FaqState.data(List<FaqQuestion> tracks) = _Data;
  const factory FaqState.loading() = _Loading;
  const factory FaqState.error() = _Error;

  factory FaqState.fromJson(Map<String, dynamic> json) =>
      _$FaqStateFromJson(json);
}
