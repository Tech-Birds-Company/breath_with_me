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

    final widgets = <Widget>[
      const Spacer(),
      StreakStatisticsItem(
        text: data.streaksCount.toString(),
        name: LocaleKeys.streakStatisticsCardStreaksCount.tr(),
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    ];

    if (data.practicesCount != null) {
      widgets.addAll(
        [
          const Spacer(),
          divider,
          const Spacer(),
          StreakStatisticsItem(
            text: data.practicesCount.toString(),
            name: LocaleKeys.streakStatisticsCardPracticesCount.tr(),
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ],
      );
    }

    if (data.minutesCount != null) {
      widgets.addAll(
        [
          const Spacer(),
          divider,
          const Spacer(),
          StreakStatisticsItem(
            text: data.minutesCount.toString(),
            name: LocaleKeys.streakStatisticsCardMinCount.tr(),
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ],
      );
    }

    if (data.dayMissedCount != null) {
      widgets.addAll(
        [
          const Spacer(),
          divider,
          const Spacer(),
          StreakStatisticsItem(
            text: data.dayMissedCount.toString(),
            name: LocaleKeys.streakStatisticsCardDayMissedCount.tr(),
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
          const Spacer(),
        ],
      );
    }

    return IntrinsicHeight(child: Row(children: widgets));
  }
}
