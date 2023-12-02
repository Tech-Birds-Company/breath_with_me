import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';

class StreakStatisticsWidget extends StatelessWidget {
  final int streaksCount;
  final int practicesCount;
  final int minutesCount;

  const StreakStatisticsWidget({
    required this.streaksCount,
    required this.practicesCount,
    required this.minutesCount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return Row(
      children: [
        _buildItem(streaksCount.toString(), 'Streaks', theme),
        _buildItem(practicesCount.toString(), 'Practices', theme),
        _buildItem(minutesCount.toString(), 'Min', theme),
      ],
    );
  }

  Widget _buildItem(String text, String name, BWMTheme theme) {
    return Expanded(
      child: Column(
        children: [
          Text(
            text,
            style: theme.typography.titleExtra.copyWith(color: theme.gray6),
          ),
          Text(
            name,
            style: theme.typography.label.copyWith(color: theme.gray4),
          ),
        ],
      ),
    );
  }
}
