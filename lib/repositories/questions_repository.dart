import 'package:breathe_with_me/features/faq/models/faq_question.dart';

abstract interface class QuestionsRepository {
  Future<List<FaqQuestion>> getQuestions();
}
