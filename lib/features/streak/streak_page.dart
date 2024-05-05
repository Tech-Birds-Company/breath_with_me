import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/features/streak/blocs/streak_bloc.dart';
import 'package:breathe_with_me/features/streak/models/streak_state.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_without_premium.dart';
import 'package:breathe_with_me/repositories/streaks_quotes_repository.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:breathe_with_me/utils/analytics/bwm_analytics.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StreakPage extends HookConsumerWidget {
  const StreakPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(Di.bloc.streak);
    final locale = EasyLocalization.of(context)!.locale;
    final theme = Theme.of(context).extension<BWMTheme>()!;

    useEffect(
      () {
        BWMAnalytics.logScreenView('StreakPage');
        return null;
      },
      const [],
    );
    return SafeArea(
      child: Stack(
        children: [
          BlocBuilder<StreakBloc, StreakState>(
            bloc: bloc,
            builder: (context, state) => StreakWithoutPremium(
              streaksCount: state.progress.totalStreak,
              quote:
                  const StreaksQuotesRepository().getQuote(locale.languageCode),
              onReminderTap: bloc.onReminderTap,
            ),
          ),
          Positioned.directional(
            textDirection: Directionality.of(context),
            top: 16,
            end: 0,
            child: IconButton(
              icon: Icon(
                Icons.close,
                size: 20,
                color: theme.primaryColor,
              ),
              onPressed: bloc.onCloseTap,
            ),
          ),
        ],
      ),
    );
  }
}
