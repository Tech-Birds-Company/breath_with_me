import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';

class StreakStatisticsItem extends StatelessWidget {
  final String text;
  final String name;
  final CrossAxisAlignment crossAxisAlignment;

  const StreakStatisticsItem({
    required this.text,
    required this.name,
    required this.crossAxisAlignment,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          text,
          style: theme.typography.titleExtra.copyWith(color: theme.gray6),
        ),
        Text(
          name,
          style: theme.typography.label.copyWith(color: theme.gray4),
        ),
      ],
    );
  }
}
