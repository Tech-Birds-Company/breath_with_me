import 'dart:ui';

import 'package:breathe_with_me/common/widgets/bwm_action_button.dart';
import 'package:breathe_with_me/features/streak/blocs/streak_bloc.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_statistics_with_details.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProfileStatistics extends StatelessWidget {
  final StreakBloc bloc;
  final VoidCallback onPremiumButtonPressed;
  final bool isUserPremium;

  const ProfileStatistics({
    required this.bloc,
    required this.onPremiumButtonPressed,
    required this.isUserPremium,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    final blurSigma = !isUserPremium ? 10.0 : 0.0;
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xFF111112),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ImageFiltered(
                imageFilter: ImageFilter.blur(
                  sigmaX: blurSigma,
                  sigmaY: blurSigma,
                ),
                child: StreakStatisticsWithDetails(
                  bloc: bloc,
                ),
              ),
              if (!isUserPremium)
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: BWMActionButton(
                    title: LocaleKeys.profilePremiumOfferButton.tr(),
                    width: double.infinity,
                    height: 40,
                    onPressed: onPremiumButtonPressed,
                    textColor: theme.purple2,
                    borderColor: theme.purple2,
                    overlayColor: theme.purple2.withAlpha(20),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
