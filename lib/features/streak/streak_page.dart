import 'package:breathe_with_me/features/streak/blocs/streak_bloc.dart';
import 'package:breathe_with_me/features/streak/models/streak_state.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_premium_missed.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_premium_started_or_continued.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_without_premium.dart';
import 'package:breathe_with_me/repositories/streaks_quotes_repository.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:breathe_with_me/utils/analytics/bwm_analytics.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class StreakPage extends HookWidget {
  final StreakBloc bloc;

  const StreakPage({
    required this.bloc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    final locale = EasyLocalization.of(context)!.locale;
    final isUserPremium = bloc.isUserPremium;

    useEffect(
      () {
        BWMAnalytics.logScreenView('StreakPage');
        return null;
      },
      const [],
    );
    return Scaffold(
      backgroundColor: theme.primaryBackground,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            BlocBuilder<StreakBloc, StreakState>(
              bloc: bloc,
              builder: (context, state) {
                if (isUserPremium) {
                  if (state.progress.totalMissedDays > 0 &&
                      !state.ignoreMissingDays) {
                    return StreakPremiumMissed(
                      configMaxLives: bloc.maxLivesCount,
                      bloc: bloc,
                    );
                  } else {
                    return StreakPremiumStartedOrContinued(bloc: bloc);
                  }
                } else {
                  return StreakWithoutPremium(
                    streaksCount: state.progress.totalStreak,
                    quote: const StreaksQuotesRepository()
                        .getQuote(locale.languageCode),
                    onReminderTap: bloc.onReminderTap,
                  );
                }
              },
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: bloc.onCloseTap,
                icon: Icon(
                  Icons.close,
                  color: theme.primaryColor,
                  size: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
