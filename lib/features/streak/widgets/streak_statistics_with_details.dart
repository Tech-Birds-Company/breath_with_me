import 'package:breathe_with_me/common/widgets/bwm_action_button.dart';
import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/features/streak/blocs/streak_bloc.dart';
import 'package:breathe_with_me/features/streak/models/streak_state.dart';
import 'package:breathe_with_me/features/streak/widgets/lives_indicator.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_statistics_item.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/repositories/models/streak_progress_v2.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StreakStatisticsWithDetails extends HookConsumerWidget {
  const StreakStatisticsWithDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    final bloc = ref.watch(Di.bloc.streak);
    final divider = VerticalDivider(
      color: theme.gray6.withOpacity(0.12),
      thickness: 1,
    );
    return BlocSelector<StreakBloc, StreakState, StreakProgressV2>(
      bloc: bloc,
      selector: (state) => state.progress,
      builder: (context, progress) {
        final lastPracticeDate = progress.lastPracticeDate;
        return StreamBuilder<bool>(
          initialData: false,
          stream: ref.watch(Di.manager.user).isPremiumUserStream,
          builder: (context, snapshot) {
            final premiumEnabled = snapshot.requireData;
            return Column(
              children: [
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      StreakStatisticsItem(
                        text: progress.totalStreak.toString(),
                        name: LocaleKeys.streakStatisticsCardStreaksCount
                            .plural(progress.totalStreak),
                        applyBlur: false,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        onTap: bloc.onOpenPaywall,
                      ),
                      divider,
                      StreakStatisticsItem(
                        text: progress.totalPractices.toString(),
                        name: LocaleKeys.streakStatisticsCardPracticesCount
                            .plural(progress.totalPractices),
                        applyBlur: !premiumEnabled,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        onTap: bloc.onOpenPaywall,
                      ),
                      divider,
                      StreakStatisticsItem(
                        text: progress.totalMinutes.toString(),
                        name: LocaleKeys.streakStatisticsCardMinCount
                            .plural(progress.totalMinutes),
                        applyBlur: !premiumEnabled,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        onTap: bloc.onOpenPaywall,
                      ),
                    ],
                  ),
                ),
                if (lastPracticeDate != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      LocaleKeys.streakLastPracticeDate
                          .tr(args: [lastPracticeDate]),
                      style:
                          theme.typography.label.copyWith(color: theme.purple2),
                    ),
                  ),
                const SizedBox(height: 16),
                Text(
                  LocaleKeys.streakLivesTitle.tr().toUpperCase(),
                  style: theme.typography.label.copyWith(color: theme.gray3),
                ),
                const SizedBox(height: 16),
                LivesIndicator(
                  totalLives: premiumEnabled ? progress.totalLives : 0,
                  configMaxLives: 3,
                  utcLivesExpireDateTime: progress.utcLivesExpireDateTime,
                  isPremiumEnabled: premiumEnabled,
                ),
                if (premiumEnabled && progress.canRestore)
                  Column(
                    children: [
                      const SizedBox(height: 16),
                      BWMActionButton(
                        title: LocaleKeys.streakMissedDayRestore.tr(),
                        height: 44,
                        onPressed: bloc.onRestoreTap,
                      ),
                    ],
                  ),
                if (!premiumEnabled)
                  Column(
                    children: [
                      const SizedBox(height: 16),
                      Text(
                        LocaleKeys.streakLivesWhenPremiumEnabled
                            .tr()
                            .toUpperCase(),
                        textAlign: TextAlign.center,
                        style: theme.typography.label.copyWith(
                          color: theme.gray6,
                        ),
                      ),
                    ],
                  ),
              ],
            );
          },
        );
      },
    );
  }
}
