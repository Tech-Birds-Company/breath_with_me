import 'dart:ui';

import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';

class StreakStatisticsItem extends StatelessWidget {
  final String text;
  final String name;
  final bool isPremiumUser;
  final CrossAxisAlignment crossAxisAlignment;

  const StreakStatisticsItem({
    required this.text,
    required this.name,
    required this.isPremiumUser,
    required this.crossAxisAlignment,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    final blurSigma = !isPremiumUser ? 13.0 : 0.0;
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        ImageFiltered(
          imageFilter: ImageFilter.blur(
            sigmaX: blurSigma,
            sigmaY: blurSigma,
          ),
          child: Text(
            text,
            style: theme.typography.titleExtra.copyWith(color: theme.gray4),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: theme.typography.label.copyWith(color: theme.gray6),
        ),
      ],
    );
  }
}
