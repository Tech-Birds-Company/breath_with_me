import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';

class ButtonWithColoredBorder extends StatelessWidget {
  final VoidCallback onTap;
  final Color borderColor;
  final String text;

  const ButtonWithColoredBorder({
    required this.text,
    required this.borderColor,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: ColoredBox(
            color: Colors.transparent,
            child: SizedBox(
              height: 40,
              child: Center(
                child: Text(
                  text,
                  style: theme.typography.bodyMTrue.copyWith(
                    color: borderColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
