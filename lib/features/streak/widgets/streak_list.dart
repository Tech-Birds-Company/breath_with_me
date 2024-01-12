import 'package:breathe_with_me/features/streak/models/streak_state.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_quote.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_statistics_card.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_weeks.dart';
import 'package:flutter/material.dart';

class StreakList extends StatelessWidget {
  final StreakState state;

  const StreakList({
    required this.state,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final widgets = <Widget>[];

    if (state.statistics != null) {
      widgets.addAll([
        const SizedBox(height: 36),
        StreakStatisticsCard(
          statisticsData: state.statistics!,
        ),
      ]);
    }

    if (state.selectedDay != null) {
      widgets.add(
        StreakWeeks(selectedDay: state.selectedDay!),
      );
    }

    if (state.quote != null) {
      widgets.add(
        StreakQuote(data: state.quote!),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ListView.separated(
        itemCount: widgets.length,
        itemBuilder: (context, index) => widgets[index],
        separatorBuilder: (context, index) => const SizedBox(height: 24),
      ),
    );
  }
}
