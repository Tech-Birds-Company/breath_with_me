import 'package:breathe_with_me/features/streak/blocs/streak_bloc.dart';
import 'package:breathe_with_me/features/streak/models/streak_state.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_statistics_item.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StreakStatisticsWithDetails extends StatelessWidget {
  final StreakBloc bloc;

  const StreakStatisticsWithDetails({
    required this.bloc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    final divider = VerticalDivider(
      color: theme.gray6.withOpacity(0.12),
      thickness: 1,
    );
    return BlocBuilder<StreakBloc, StreakState>(
      bloc: bloc,
      builder: (context, state) {
        final progress = state.progress;
        return IntrinsicHeight(
          child: Row(
            children: [
              const Spacer(),
              StreakStatisticsItem(
                text: progress.totalStreak.toString(),
                name: LocaleKeys.streakStatisticsCardStreaksCount
                    .plural(progress.totalStreak),
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
              const Spacer(),
              divider,
              const Spacer(),
              StreakStatisticsItem(
                text: progress.totalPractices.toString(),
                name: LocaleKeys.streakStatisticsCardPracticesCount
                    .plural(progress.totalPractices),
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
              const Spacer(),
              divider,
              const Spacer(),
              StreakStatisticsItem(
                text: progress.totalMinutes.toString(),
                name: LocaleKeys.streakStatisticsCardMinCount
                    .plural(progress.totalMinutes),
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
