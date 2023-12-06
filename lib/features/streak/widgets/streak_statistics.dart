import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class StreakStatisticsData {
  final int streaksCount;
  final int? practicesCount;
  final int? minutesCount;
  final int? dayMissedCount;

  StreakStatisticsData({
    required this.streaksCount,
    required this.practicesCount,
    required this.minutesCount,
    required this.dayMissedCount,
  });
}

class StreakStatistics extends StatelessWidget {
  final StreakStatisticsData data;

  const StreakStatistics({
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;

    final widgets = <Widget>[
      const Spacer(),
      _buildItem(
        data.streaksCount.toString(),
        LocaleKeys.streakStatisticsCardStreaksCount.tr(),
        theme,
        CrossAxisAlignment.center,
      ),
    ];

    if (data.practicesCount != null) {
      widgets.addAll(
        [
          const Spacer(),
          _buildDivider(theme),
          const Spacer(),
          _buildItem(
            data.practicesCount.toString(),
            LocaleKeys.streakStatisticsCardPracticesCount.tr(),
            theme,
            CrossAxisAlignment.center,
          ),
        ],
      );
    }

    if (data.minutesCount != null) {
      widgets.addAll(
        [
          const Spacer(),
          _buildDivider(theme),
          const Spacer(),
          _buildItem(
            data.minutesCount.toString(),
            LocaleKeys.streakStatisticsCardMinCount.tr(),
            theme,
            CrossAxisAlignment.center,
          ),
        ],
      );
    }

    if (data.dayMissedCount != null) {
      widgets.addAll(
        [
          const Spacer(),
          _buildDivider(theme),
          const Spacer(),
          _buildItem(
            data.dayMissedCount.toString(),
            LocaleKeys.streakStatisticsCardDayMissedCount.tr(),
            theme,
            CrossAxisAlignment.center,
          ),
          const Spacer(),
        ],
      );
    }

    return IntrinsicHeight(child: Row(children: widgets));
  }

  Widget _buildItem(
    String text,
    String name,
    BWMTheme theme,
    CrossAxisAlignment crossAxisAlignment,
  ) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          text,
          style: theme.typography.titleExtra.copyWith(color: theme.gray6),
        ),
        Text(
          name,
          style: theme.typography.label.copyWith(color: theme.gray4),
        ),
      ],
    );
  }

  Widget _buildDivider(BWMTheme theme) {
    return VerticalDivider(
      color: theme.gray6.withOpacity(0.12),
      thickness: 1,
    );
  }
}
