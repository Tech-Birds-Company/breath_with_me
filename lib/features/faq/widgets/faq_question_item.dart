import 'package:breathe_with_me/features/faq/models/faq_question.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';

class FaqQuestionItem extends StatelessWidget {
  final FaqQuestion question;

  const FaqQuestionItem({
    required this.question,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return ExpansionTile(
      iconColor: theme.green4,
      collapsedIconColor: theme.green4,
      expandedAlignment: Alignment.centerLeft,
      title: Text(
        question.title,
        style: theme.typography.heading3.copyWith(
          color: theme.gray4,
        ),
      ),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            question.description,
            style: theme.typography.bodyM.copyWith(
              color: theme.gray6,
            ),
          ),
        )
      ],
    );
  }
}
