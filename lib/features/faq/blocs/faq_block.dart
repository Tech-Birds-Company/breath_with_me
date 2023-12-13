import 'package:breathe_with_me/features/faq/models/faq_language.dart';
import 'package:breathe_with_me/features/faq/models/faq_state.dart';
import 'package:breathe_with_me/repositories/faq_questions_repository.dart';
import 'package:breathe_with_me/utils/cacheable_bloc/cacheable_bloc.dart';

final class FaqBloc extends CacheableBloc<FaqState> {
  final FaqQuestionsRepository _questionsRepository;

  FaqBloc(this._questionsRepository) : super(const FaqState.loading());

  Future<void> loadQuestions(String languageCode) async {
    final language = FaqLanguageHelper.fromCode(languageCode);
    final questions = await _questionsRepository.getQuestions(language);
    emit(FaqState.data(questions));
  }

  @override
  FaqState fromJson(Map<String, dynamic> json) => FaqState.fromJson(json);

  @override
  Map<String, dynamic> toJson(FaqState state) => state.toJson();
}
