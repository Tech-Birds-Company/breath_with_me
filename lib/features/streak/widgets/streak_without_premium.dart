import 'package:breathe_with_me/features/streak/widgets/streak_quote.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_statistics_card.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_weeks.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/repositories/models/streak_quote_data.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class StreakWithoutPremium extends StatelessWidget {
  final int streaksCount;
  final StreakQuoteData quote;
  final VoidCallback onReminderTap;

  const StreakWithoutPremium({
    required this.streaksCount,
    required this.quote,
    required this.onReminderTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    final widgets = [
      const SizedBox(height: 32),
      const StreakStatisticsCard(),
      StreakWeeks(selectedDay: streaksCount),
      ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          LocaleKeys.reminderTitle.tr(),
          style: theme.typography.bodyM.copyWith(
            color: theme.gray6,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: theme.gray6,
          size: 16,
        ),
        onTap: onReminderTap,
      ),
      StreakQuote(data: quote),
    ];
    return ListView.separated(
      itemCount: widgets.length,
      padding: const EdgeInsets.all(16),
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) => widgets[index],
    );
  }
}
