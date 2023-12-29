import 'package:breathe_with_me/features/streak/models/streak_quote_data.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';

class StreakQuote extends StatelessWidget {
  final StreakQuoteData data;

  const StreakQuote({
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data.quote,
          style: theme.typography.heading3.copyWith(color: theme.gray6),
        ),
        const SizedBox(height: 24),
        Text(
          '— ${data.author}',
          style: theme.typography.bodyM.copyWith(color: theme.gray4),
        ),
      ],
    );
  }
}
