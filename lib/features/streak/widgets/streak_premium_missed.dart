import 'package:breathe_with_me/features/streak/models/streak_lives_data.dart';
import 'package:breathe_with_me/features/streak/models/streak_statistics_data.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_lives.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_statistics_card.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';

class StreakPremiumMissed extends StatelessWidget {
  final StreakStatisticsData statistics;
  final StreakLivesData lives;

  const StreakPremiumMissed({
    required this.statistics,
    required this.lives,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Column(
        children: [
          StreakStatisticsCard(statisticsData: statistics),
          const SizedBox(height: 20),
          StreakLives(data: lives),
        ],
      ),
    );
  }
}
