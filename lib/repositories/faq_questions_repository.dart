import 'package:breathe_with_me/features/faq/models/faq_question.dart';
import 'package:breathe_with_me/utils/content_language.dart';

abstract interface class FaqQuestionsRepository {
  Future<List<FaqQuestion>> getQuestions(ContentLanguage language);
}
