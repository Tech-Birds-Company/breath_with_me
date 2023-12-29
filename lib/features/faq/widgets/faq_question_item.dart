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
      key: PageStorageKey(question.id),
      iconColor: theme.green3,
      shape: LinearBorder.none,
      collapsedIconColor: theme.green3,
      expandedAlignment: Alignment.centerLeft,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Text(
          question.title,
          style: theme.typography.heading3.copyWith(
            color: theme.gray4,
          ),
        ),
      ),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            top: 6,
            left: 20,
            right: 20,
          ),
          child: Text(
            question.description.replaceAll(r'\n', '\n'),
            style: theme.typography.bodyM.copyWith(
              color: theme.gray6,
            ),
          ),
        ),
      ],
    );
  }
}
