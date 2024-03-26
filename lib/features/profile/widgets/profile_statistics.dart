import 'package:breathe_with_me/features/streak/widgets/streak_statistics_with_details.dart';
import 'package:flutter/material.dart';

class ProfileStatistics extends StatelessWidget {
  const ProfileStatistics({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 32),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xFF111112),
          ),
          child: const Padding(
            padding: EdgeInsets.all(16),
            child: StreakStatisticsWithDetails(),
          ),
        ),
      );
}
