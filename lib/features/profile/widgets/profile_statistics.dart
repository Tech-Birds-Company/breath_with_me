import 'package:breathe_with_me/features/profile/models/profile_statistics_state.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_statistics.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';

class ProfileStatistics extends StatelessWidget {
  final ProfileStatisticsState state;

  const ProfileStatistics({
    required this.state,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;

    return state.when(
      empty: () => const SizedBox(),
      premiumOffer: () => const SizedBox(),
      streakStatistics: (streaksStatistics) {
        return Padding(
          padding: const EdgeInsets.only(top: 32),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xFF111112),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: StreakStatistics(data: streaksStatistics),
            ),
          ),
        );
      },
    );
  }
}
