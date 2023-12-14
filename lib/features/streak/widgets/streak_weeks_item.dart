import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';

enum StreakWeeksItemType { standard, selected, filled }

class StreakWeeksItem extends StatelessWidget {
  final int day;
  final StreakWeeksItemType type;

  const StreakWeeksItem({
    required this.day,
    required this.type,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    final decoration = BoxDecoration(
      shape: BoxShape.circle,
      color: type != StreakWeeksItemType.standard ? theme.green3 : null,
      border: type == StreakWeeksItemType.standard ? Border.all(width: 2, color: const Color(0xFF5D5D6D)) : null,
    );

    final textColor = type == StreakWeeksItemType.standard ? const Color(0xFF5D5D6D) : Colors.black;
    final textWidget = DecoratedBox(
      decoration: decoration,
      child: Center(
        child: Text(
          day.toString(),
          style: theme.typography.bodyMTrue.copyWith(color: textColor),
          textAlign: TextAlign.center,
        ),
      ),
    );

    return SizedBox(
      height: 32,
      width: 32,
      child: type == StreakWeeksItemType.selected
          ? Stack(
              children: [
                textWidget,
                Center(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 2,
                        color: const Color(0xFF4F4F4F),
                      ),
                    ),
                    child: const SizedBox(width: 28, height: 28),
                  ),
                ),
              ],
            )
          : textWidget,
    );
  }
}
