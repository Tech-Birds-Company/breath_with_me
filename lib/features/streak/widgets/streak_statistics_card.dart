import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/features/streak/models/streak_statistics_data.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_statistics.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StreakStatisticsCard extends StatelessWidget {
  final StreakStatisticsData statisticsData;

  const StreakStatisticsCard({
    required this.statisticsData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFF111112),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  LocaleKeys.streakStatisticsCardTitle.tr().toUpperCase(),
                  style: theme.typography.label.copyWith(color: theme.gray4),
                ),
                const Spacer(),
                SvgPicture.asset(
                  BWMAssets.logoIcon,
                  width: 56,
                ),
              ],
            ),
            const SizedBox(height: 8),
            StreakStatistics(data: statisticsData),
          ],
        ),
      ),
    );
  }
}
