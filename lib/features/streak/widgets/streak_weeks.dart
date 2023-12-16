import 'package:breathe_with_me/features/streak/widgets/streak_weeks_item.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';

class StreakWeeks extends StatelessWidget {
  final int daysInRow;
  final int rows;
  final int selectedDay;

  const StreakWeeks({
    required this.selectedDay,
    this.daysInRow = 7,
    this.rows = 2,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final allDays = daysInRow * rows;
    final startDay = (selectedDay ~/ allDays) * allDays + 1;
    final theme = Theme.of(context).extension<BWMTheme>()!;

    return Column(
      children: [
        for (var rowIndex = 0; rowIndex < rows; rowIndex++) ...[
          Row(
            children: [
              for (var i = 0; i < daysInRow; i++) ...[
                StreakWeeksItem(
                  day: startDay + i + daysInRow * rowIndex,
                  type: _getItemType(startDay + i + daysInRow * rowIndex),
                ),
                if (i < daysInRow - 1)
                  Expanded(
                    child: Divider(
                      color: startDay + i + daysInRow * rowIndex < selectedDay
                          ? theme.green3
                          : const Color(0xFF5D5D6D),
                      thickness: 1,
                    ),
                  ),
              ],
            ],
          ),
          if (rowIndex < rows - 1) const SizedBox(height: 12),
        ],
      ],
    );
  }

  StreakWeeksItemType _getItemType(int day) {
    if (day == selectedDay) return StreakWeeksItemType.selected;
    if (day < selectedDay) return StreakWeeksItemType.filled;
    return StreakWeeksItemType.standard;
  }
}
