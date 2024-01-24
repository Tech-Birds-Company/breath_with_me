import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/features/streak/blocs/streak_bloc.dart';
import 'package:breathe_with_me/features/streak/models/streak_state.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_premium_missed.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_premium_started_or_continued.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_without_premium.dart';
import 'package:breathe_with_me/repositories/streaks_quotes_repository.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StreakPage extends ConsumerWidget {
  const StreakPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    final bloc = ref.watch(Di.bloc.streak);
    return Scaffold(
      backgroundColor: theme.primaryBackground,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            BlocBuilder<StreakBloc, StreakState>(
              bloc: bloc,
              builder: (context, state) {
                final locale = EasyLocalization.of(context)!.locale;
                return state.when(
                  loading: (_) => Center(
                    child: CircularProgressIndicator(color: theme.green3),
                  ),
                  error: (_) => Center(
                    child: CircularProgressIndicator(color: theme.green3),
                  ),
                  data: (progress, premiumEnabled, useMissingDays) {
                    if (premiumEnabled) {
                      if (progress.totalMissedDays > 0 && useMissingDays) {
                        return StreakPremiumMissed(
                          bloc: bloc,
                          onRestoreTap: bloc.onRestoreTap,
                          onSkipTap: bloc.onSkipTap,
                        );
                      } else {
                        return StreakPremiumStartedOrContinued(bloc: bloc);
                      }
                    } else {
                      return StreakWithoutPremium(
                        streaksCount: progress.totalStreak,
                        quote: const StreaksQuotesRepository()
                            .getQuote(locale.languageCode),
                      );
                    }
                  },
                );
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
