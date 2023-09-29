import 'package:breath_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';

class PracticeTutor extends StatelessWidget {
  final String tutorAvatarUrl;
  final String tutorName;

  const PracticeTutor({
    required this.tutorAvatarUrl,
    required this.tutorName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return Row(
      children: [
        Image(
          image: AssetImage(tutorAvatarUrl),
        ),
        const SizedBox(width: 8),
        Text(
          tutorName.toUpperCase(),
          style: theme.typography.bodyMTrue.copyWith(
            color: theme.primaryText,
          ),
        ),
      ],
    );
  }
}
