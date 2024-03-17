import 'package:breathe_with_me/features/streak/blocs/streak_bloc.dart';
import 'package:breathe_with_me/features/streak/models/streak_state.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_statistics_with_details.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_statistics_with_missing_days.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StreakStatistics extends StatelessWidget {
  final StreakBloc bloc;

  const StreakStatistics({
    required this.bloc,
    super.key,
  });

  @override
  Widget build(BuildContext context) => BlocBuilder<StreakBloc, StreakState>(
        bloc: bloc,
        builder: (context, state) {
          final progress = state.progress;
          final ignoreMissingDays = state.ignoreMissingDays;
          final hasMissedDays = progress.totalMissedDays > 0;
          if (hasMissedDays && !ignoreMissingDays) {
            return StreakStatisticsWithMissingDays(bloc: bloc);
          }
          return const StreakStatisticsWithDetails();
        },
      );
}
