import 'package:breathe_with_me/features/streak/models/streak_state.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_quote.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_statistics_card.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_weeks.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';

class StreakList extends StatelessWidget {
  final StreakState state;

  const StreakList({
    required this.state,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;

    final widgets = <Widget>[];

    if (state.statistics != null) {
      widgets.addAll([
        StreakStatisticsCard(
          statisticsData: state.statistics!,
        ),
        const SizedBox(height: 24),
      ]);
    }

    if (state.selectedDay != null) {
      widgets.addAll([
        StreakWeeks(selectedDay: state.selectedDay!),
        const SizedBox(height: 44),
      ]);
    }

    if (state.quote != null) {
      widgets.addAll([
        StreakQuote(data: state.quote!),
        const SizedBox(height: 20),
        Divider(color: theme.secondaryBackground),
      ]);
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 60,
          ),
          child: Column(
            children: widgets,
          ),
        ),
      ],
    );
  }
}
