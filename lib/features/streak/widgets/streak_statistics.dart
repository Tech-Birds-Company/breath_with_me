import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/features/streak/blocs/streak_bloc.dart';
import 'package:breathe_with_me/features/streak/models/streak_state.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_statistics_with_details.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_statistics_with_missing_days.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StreakStatistics extends ConsumerWidget {
  const StreakStatistics({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(Di.bloc.streak);
    return BlocBuilder<StreakBloc, StreakState>(
      bloc: bloc,
      builder: (context, state) {
        final progress = state.progress;
        final hasMissedDays = progress.totalMissedDays > 0;
        if (hasMissedDays) {
          return const StreakStatisticsWithMissingDays();
        }
        return const StreakStatisticsWithDetails();
      },
    );
  }
}
