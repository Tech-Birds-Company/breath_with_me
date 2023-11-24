import 'package:breathe_with_me/features/faq/models/faq_question.dart';
import 'package:breathe_with_me/features/faq/widgets/faq_question_item.dart';
import 'package:flutter/material.dart';

class FaqQuestionList extends StatelessWidget {
  final List<FaqQuestion> questions;

  const FaqQuestionList({
    required this.questions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.separated(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return FaqQuestionItem(question: questions[index]);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 20);
        },
      ),
    );
  }
}
