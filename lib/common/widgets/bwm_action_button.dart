import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';

class BWMActionButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final double width;
  final double height;

  const BWMActionButton({
    required this.title,
    required this.width,
    required this.height,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: theme.green3,
        ),
      ),
      child: SizedBox(
        width: width,
        height: height,
        child: TextButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(
              theme.green3.withOpacity(0.3),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            title,
            style: theme.typography.bodyM.copyWith(
              color: theme.green3,
            ),
          ),
        ),
      ),
    );
  }
}
