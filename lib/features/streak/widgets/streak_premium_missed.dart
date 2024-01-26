import 'package:breathe_with_me/common/widgets/bwm_action_button.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_statistics_card.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StreakPremiumMissed extends ConsumerWidget {
  final int totalLives;
  final VoidCallback onRestoreTap;
  final VoidCallback onSkipTap;

  const StreakPremiumMissed({
    required this.totalLives,
    required this.onRestoreTap,
    required this.onSkipTap,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Column(
        children: [
          const StreakStatisticsCard(),
          const SizedBox(height: 20),
          Text(
            LocaleKeys.streakMissedDayTitle.tr(),
            style: theme.typography.heading3.copyWith(color: theme.primaryText),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            LocaleKeys.streakMissedDaySubtitle.tr(),
            style: theme.typography.bodyS.copyWith(color: theme.primaryText),
            textAlign: TextAlign.center,
          ),
          if (totalLives > 0)
            Padding(
              padding: const EdgeInsets.only(top: 36, bottom: 8),
              child: BWMActionButton(
                onPressed: onRestoreTap,
                title: LocaleKeys.streakMissedDayRestore.tr(),
                width: 200,
                height: 40,
              ),
            ),
          TextButton(
            onPressed: onSkipTap,
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
