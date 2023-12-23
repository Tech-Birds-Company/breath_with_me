import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';

class BottomSheetNotch extends StatelessWidget {
  const BottomSheetNotch({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: SizedBox(
          width: 44,
          height: 4,
          child: ColoredBox(
            color: theme.secondaryBackground,
          ),
        ),
      ),
    );
  }
}
