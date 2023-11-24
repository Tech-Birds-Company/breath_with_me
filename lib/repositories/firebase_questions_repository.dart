import 'package:breathe_with_me/constants.dart';
import 'package:breathe_with_me/features/faq/models/faq_question.dart';
import 'package:breathe_with_me/repositories/questions_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final class FirebaseQuestionsRepository implements QuestionsRepository {
  const FirebaseQuestionsRepository();

  @override
  Future<List<FaqQuestion>> getQuestions() async {
    final response = await FirebaseFirestore.instance
        .collection(BWMConstants.questionsCollection)
        .get();
    final questions = <FaqQuestion>[];

    for (final doc in response.docs) {
      final question = await _getQuestionFromDocument(doc);
      questions.add(question);
    }

    return questions;
  }

  Future<FaqQuestion> _getQuestionFromDocument(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) async {
    final id = document.id;
    final data = document.data();

    final trackJson = {
      'id': id,
      ...data!,
    };

    return FaqQuestion.fromJson(trackJson);
  }
}
