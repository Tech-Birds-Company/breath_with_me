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
    final theme = Theme.of(context).extension<BWMTheme>()!;
    const startDay = 1;

    return Row(
      children: [
        _buildRow(startDay, theme),
        _buildRow(startDay + daysInRow, theme),
      ],
    );
  }

  Widget _buildRow(int startDay, BWMTheme theme) {
    final items = <Widget>[];

    for (var i = 0; i < daysInRow; i++) {
      final currentDay = startDay + i;

      if (currentDay == selectedDay) {
        items.add(_buildItemSelected(currentDay, theme));
      } else if (currentDay < selectedDay!) {
        items.add(_buildItemFilled(currentDay, theme));
      } else {
        items.add(_buildItemDefault(currentDay, theme));
      }

      if (i < daysInRow - 1) {
        if (currentDay < selectedDay!) {
          items.add(_buildLine(true, theme));
        } else {
          items.add(_buildLine(false, theme));
        }
      }
    }

    return Row(children: items);
  }

  Widget _buildLine(
    bool isSelected,
    BWMTheme theme,
  ) {
    final color = isSelected ? theme.green3 : const Color(0xFF5D5D6D);
    return Expanded(
      child: SizedBox(
        height: 1,
        child: DecoratedBox(
          decoration: BoxDecoration(color: color),
        ),
      ),
    );
  }

  Widget _buildItemFilled(
    int day,
    BWMTheme theme,
  ) {
    return SizedBox(
      height: 32,
      width: 32,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: theme.green3,
        ),
        child: Text(
          day.toString(),
          style: theme.typography.bodyMTrue.copyWith(color: theme.primaryText),
        ),
      ),
    );
  }

  Widget _buildItemSelected(
    int day,
    BWMTheme theme,
  ) {
    return SizedBox(
      height: 32,
      width: 32,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: theme.green3,
        ),
        child: Text(
          day.toString(),
          style: theme.typography.bodyMTrue.copyWith(color: theme.primaryText),
        ),
      ),
    );
  }

  Widget _buildItemDefault(
    int day,
    BWMTheme theme,
  ) {
    return SizedBox(
      height: 32,
      width: 32,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 2,
            color: const Color(0xFF5D5D6D),
          ),
        ),
        child: Text(
          day.toString(),
          style: theme.typography.bodyMTrue.copyWith(color: const Color(0xFF5D5D6D)),
        ),
      ),
    );
  }
}
