import 'package:breathe_with_me/features/streak/blocs/streak_bloc.dart';
import 'package:breathe_with_me/features/streak/models/streak_state.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_premium_missed.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_premium_started_or_continued.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_without_premium.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
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
    final languageCode = EasyLocalization.of(context)!.locale.languageCode;
    final theme = Theme.of(context).extension<BWMTheme>()!;

    useEffect(
      () {
        bloc.init(languageCode);
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
                return state.when(
                  loading: () {
                    return Center(
                      child: CircularProgressIndicator(color: theme.green3),
                    );
                  },
                  withoutPremium: (streaksCount, quote) {
                    return StreakWithoutPremium(
                      streaksCount: streaksCount,
                      quote: quote,
                    );
                  },
                  premiumStartedOrContinued:
                      (statistics, streaksCount, lives, quote) {
                    return StreakPremiumStartedOrContinued(
                      statistics: statistics,
                      streaksCount: streaksCount,
                      lives: lives,
                      quote: quote,
                    );
                  },
                  premiumMissed: (statistics, lives) {
                    return StreakPremiumMissed(
                      statistics: statistics,
                      lives: lives,
                      onRestoreTap: bloc.onRestoreTap,
                      onSkipTap: bloc.onSkipTap,
                    );
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
