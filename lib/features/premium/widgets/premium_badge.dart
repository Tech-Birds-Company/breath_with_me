import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';

class PremiumBadge extends StatelessWidget {
  final String text;

  const PremiumBadge({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return SizedBox(
      height: 24,
      child: Row(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: theme.purple2,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  text.toUpperCase(),
                  style: theme.typography.labelM.copyWith(
                    color: theme.primaryText,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
