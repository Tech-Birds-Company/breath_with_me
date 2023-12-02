import 'package:breathe_with_me/features/faq/models/faq_state.dart';
import 'package:breathe_with_me/repositories/faq_questions_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class FaqBloc extends BlocBase<FaqState> {
  final FaqQuestionsRepository _questionsRepository;

  FaqBloc(
    this._questionsRepository,
  ) : super(const FaqState.loading()) {
    loadQuestions();
  }

  Future<void> loadQuestions() async {
    final questions = await _questionsRepository.getQuestions();
    emit(FaqState.data(questions));
  }
}
