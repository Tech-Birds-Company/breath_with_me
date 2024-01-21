import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/common/widgets/bwm_action_button.dart';
import 'package:breathe_with_me/features/profile/models/profile_statistics_state.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_statistics.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileStatistics extends StatelessWidget {
  final ProfileStatisticsState state;
  final VoidCallback onPremiumButtonPressed;

  const ProfileStatistics({
    required this.state,
    required this.onPremiumButtonPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;

    return state.when(
      empty: () => const SizedBox(),
      premiumOffer: () => Padding(
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
                Row(
                  children: [
                    SvgPicture.asset(
                      BWMAssets.checkmark,
                      height: 16,
                      width: 16,
                      colorFilter: ColorFilter.mode(
                        theme.primaryText,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      LocaleKeys.profilePremiumOffer1.tr(),
                      style: theme.typography.bodyS
                          .copyWith(color: theme.primaryText),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    SvgPicture.asset(
                      BWMAssets.checkmark,
                      height: 16,
                      width: 16,
                      colorFilter: ColorFilter.mode(
                        theme.primaryText,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      LocaleKeys.profilePremiumOffer2.tr(),
                      style: theme.typography.bodyS
                          .copyWith(color: theme.primaryText),
                    ),
                  ],
                ),
                const SizedBox(height: 22),
                BWMActionButton(
                  title: LocaleKeys.profilePremiumOfferButton.tr(),
                  width: double.infinity,
                  height: 40,
                  onPressed: onPremiumButtonPressed,
                  textColor: theme.purple2,
                  borderColor: theme.purple2,
                  overlayColor: theme.purple2.withAlpha(20),
                ),
              ],
            ),
          ),
        ),
      ),
      streakStatistics: (streaksStatistics) {
        return Padding(
          padding: const EdgeInsets.only(top: 32),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xFF111112),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: StreakStatistics(data: streaksStatistics),
            ),
          ),
        );
      },
    );
  }
}
