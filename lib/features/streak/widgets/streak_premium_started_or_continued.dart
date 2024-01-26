import 'package:breathe_with_me/features/streak/widgets/streak_quote.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_statistics_card.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_weeks.dart';
import 'package:breathe_with_me/repositories/streaks_quotes_repository.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class StreakPremiumStartedOrContinued extends StatelessWidget {
  final int totalStreak;

  const StreakPremiumStartedOrContinued({
    required this.totalStreak,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    final locale = EasyLocalization.of(context)!.locale;
    final widgets = <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const StreakStatisticsCard(),
            const SizedBox(height: 24),
            StreakWeeks(selectedDay: totalStreak),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: StreakQuote(
          data: const StreaksQuotesRepository().getQuote(locale.languageCode),
        ),
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
