import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';

enum StreakWeeksItemType {
  standart,
  selected,
  filled,
}

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
        _buildRow(startDay, theme),
        const SizedBox(height: 12),
        _buildRow(startDay + daysInRow, theme),
      ],
    );
  }

  Widget _buildRow(int startDay, BWMTheme theme) {
    final items = <Widget>[];

    for (var i = 0; i < daysInRow; i++) {
      final currentDay = startDay + i;

      if (currentDay == selectedDay) {
        items.add(_buildItem(currentDay, StreakWeeksItemType.selected, theme));
      } else if (currentDay < selectedDay) {
        items.add(_buildItem(currentDay, StreakWeeksItemType.filled, theme));
      } else {
        items.add(_buildItem(currentDay, StreakWeeksItemType.standart, theme));
      }

      if (i < daysInRow - 1) {
        if (currentDay < selectedDay) {
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
      child: Divider(
        color: color,
        thickness: 1,
      ),
    );
  }

  Widget _buildItem(int day, StreakWeeksItemType type, BWMTheme theme) {
    BoxDecoration decoration;
    switch (type) {
      case StreakWeeksItemType.standart:
        decoration = BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 2,
            color: const Color(0xFF5D5D6D),
          ),
        );
      case StreakWeeksItemType.selected:
        decoration = BoxDecoration(
          shape: BoxShape.circle,
          color: theme.green3,
        );
      case StreakWeeksItemType.filled:
        decoration = BoxDecoration(
          shape: BoxShape.circle,
          color: theme.green3,
        );
    }

    Color textColor;
    switch (type) {
      case StreakWeeksItemType.standart:
        textColor = const Color(0xFF5D5D6D);
      case StreakWeeksItemType.selected:
        textColor = Colors.black;
      case StreakWeeksItemType.filled:
        textColor = Colors.black;
    }

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

    Widget itemWidget;
    if (type == StreakWeeksItemType.selected) {
      itemWidget = Stack(
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
              child: const SizedBox(
                width: 28,
                height: 28,
              ),
            ),
          ),
        ],
      );
    } else {
      itemWidget = textWidget;
    }

    return SizedBox(
      height: 32,
      width: 32,
      child: itemWidget,
    );
  }
}
