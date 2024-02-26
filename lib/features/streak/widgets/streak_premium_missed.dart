import 'package:breathe_with_me/common/widgets/bwm_action_button.dart';
import 'package:breathe_with_me/features/streak/blocs/streak_bloc.dart';
import 'package:breathe_with_me/features/streak/widgets/lives_indicator.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_statistics_card.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class StreakPremiumMissed extends StatelessWidget {
  final StreakBloc bloc;
  final int configMaxLives;

  const StreakPremiumMissed({
    required this.bloc,
    required this.configMaxLives,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    final progress = bloc.state.progress;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Column(
        children: [
          StreakStatisticsCard(bloc: bloc),
          const SizedBox(height: 16),
          if (progress.totalLives >= progress.totalMissedDays)
            Text(
              LocaleKeys.streakMissedDayTitle.tr(),
              style:
                  theme.typography.heading3.copyWith(color: theme.primaryText),
              textAlign: TextAlign.center,
            ),
          const SizedBox(height: 16),
          if (progress.totalLives >= progress.totalMissedDays)
            Text(
              LocaleKeys.streakMissedDaySubtitle
                  .plural(progress.totalMissedDays),
              style: theme.typography.bodyS.copyWith(color: theme.primaryText),
              textAlign: TextAlign.center,
            ),
          const SizedBox(height: 16),
          LivesIndicator(
            totalLives: progress.totalLives,
            configMaxLives: configMaxLives,
          ),
          if (progress.totalLives >= progress.totalMissedDays)
            Padding(
              padding: const EdgeInsets.only(top: 36, bottom: 8),
              child: BWMActionButton(
                onPressed: bloc.onRestoreTap,
                title: LocaleKeys.streakMissedDayRestore.tr(),
                width: 200,
                height: 40,
              ),
            ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: bloc.onSkipTap,
            child: Text(
              LocaleKeys.streakMissedDaySkip.tr(),
              style: theme.typography.bodyMTrue.copyWith(color: theme.gray4),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
