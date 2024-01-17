import 'package:breathe_with_me/features/streak/models/streak_lives_data.dart';
import 'package:breathe_with_me/features/streak/models/streak_statistics_data.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_lives.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_quote.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_statistics_card.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_weeks.dart';
import 'package:breathe_with_me/repositories/models/streak_quote_data.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';

class StreakPremiumStartedOrContinued extends StatelessWidget {
  final StreakStatisticsData statistics;
  final int streaksCount;
  final StreakLivesData lives;
  final StreakQuoteData quote;

  const StreakPremiumStartedOrContinued({
    required this.statistics,
    required this.streaksCount,
    required this.lives,
    required this.quote,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;

    final widgets = <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            StreakStatisticsCard(statisticsData: statistics),
            const SizedBox(height: 24),
            StreakWeeks(selectedDay: streaksCount),
            const SizedBox(height: 24),
            StreakLives(data: lives),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: StreakQuote(data: quote),
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: ListView.separated(
        itemCount: widgets.length,
        itemBuilder: (context, index) => widgets[index],
        separatorBuilder: (context, index) => Divider(
          thickness: 1,
          color: theme.secondaryBackground,
        ),
      ),
    );
  }
}
