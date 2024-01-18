import 'package:breathe_with_me/features/streak/widgets/streak_quote.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_weeks.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/repositories/models/streak_quote_data.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class StreakWithoutPremium extends StatelessWidget {
  final int streaksCount;
  final StreakQuoteData quote;

  const StreakWithoutPremium({
    required this.streaksCount,
    required this.quote,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;

    final widgets = <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        child: Column(
          children: [
            Text(
              LocaleKeys.streakWithoutPremiumTitle.tr().toUpperCase(),
              style: theme.typography.label.copyWith(color: theme.gray4),
            ),
            const SizedBox(height: 4),
            ShaderMask(
              shaderCallback: LinearGradient(
                colors: [theme.green3, theme.gray4],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader,
              child: Text(
                LocaleKeys.streakWithoutPremiumSubtitle
                    .plural(streaksCount)
                    .toUpperCase(),
                style: theme.typography.bodyM.copyWith(color: theme.gray4),
              ),
            ),
            const SizedBox(height: 20),
            StreakWeeks(selectedDay: streaksCount),
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
