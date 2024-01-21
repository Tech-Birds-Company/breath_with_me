import 'package:breathe_with_me/features/streak/models/streak_statistics_data.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_statistics_item.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class StreakStatistics extends StatelessWidget {
  final StreakStatisticsData data;

  const StreakStatistics({
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;

    final divider = VerticalDivider(
      color: theme.gray6.withOpacity(0.12),
      thickness: 1,
    );

    return data.when(
      full: (streaksCount, practicesCount, minutesCount) {
        return IntrinsicHeight(
          child: Row(
            children: [
              const Spacer(),
              StreakStatisticsItem(
                text: streaksCount.toString(),
                name: LocaleKeys.streakStatisticsCardStreaksCount
                    .plural(streaksCount),
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
              const Spacer(),
              divider,
              const Spacer(),
              StreakStatisticsItem(
                text: practicesCount.toString(),
                name: LocaleKeys.streakStatisticsCardPracticesCount
                    .plural(practicesCount),
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
              const Spacer(),
              divider,
              const Spacer(),
              StreakStatisticsItem(
                text: minutesCount.toString(),
                name: LocaleKeys.streakStatisticsCardMinCount
                    .plural(minutesCount),
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
              const Spacer(),
            ],
          ),
        );
      },
      missed: (streaksCount, missedDaysCount) {
        return IntrinsicHeight(
          child: Row(
            children: [
              const Spacer(),
              StreakStatisticsItem(
                text: streaksCount.toString(),
                name: LocaleKeys.streakStatisticsCardStreaksCount
                    .plural(streaksCount),
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
              const Spacer(),
              divider,
              const Spacer(),
              StreakStatisticsItem(
                text: missedDaysCount.toString(),
                name: LocaleKeys.streakStatisticsCardDayMissedCount
                    .plural(missedDaysCount),
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
              const Spacer(),
            ],
          ),
        );
      },
    );
  }
}
