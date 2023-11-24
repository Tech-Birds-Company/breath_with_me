import 'package:breathe_with_me/features/faq/models/faq_question.dart';

abstract interface class FaqQuestionsRepository {
  Future<List<FaqQuestion>> getQuestions();
}
