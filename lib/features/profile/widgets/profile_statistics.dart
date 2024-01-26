import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/common/widgets/bwm_action_button.dart';
import 'package:breathe_with_me/features/premium/premium_constants.dart';
import 'package:breathe_with_me/features/streak/widgets/streak_statistics_with_details.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileStatistics extends ConsumerWidget {
  final VoidCallback onPremiumButtonPressed;
  final bool premiumEnabled;

  const ProfileStatistics({
    required this.onPremiumButtonPressed,
    required this.premiumEnabled,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    if (premiumEnabled) {
      return Padding(
        padding: const EdgeInsets.only(top: 32),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xFF111112),
          ),
          child: const Padding(
            padding: EdgeInsets.all(16),
            child: StreakStatisticsWithDetails(),
          ),
        ),
      );
    } else {
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
                for (final offer in PremiumConstants.premiumOffers)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: Row(
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
                        Expanded(
                          child: Text(
                            offer.tr(),
                            maxLines: 2,
                            style: theme.typography.bodyS
                                .copyWith(color: theme.primaryText),
                          ),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 20),
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
      );
    }
  }
}
