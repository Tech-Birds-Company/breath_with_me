import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/common/widgets/bwm_action_button.dart';
import 'package:breathe_with_me/features/premium/premium_constants.dart';
import 'package:breathe_with_me/features/premium/widgets/premium_badge.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PremiumBannerTracks extends StatelessWidget {
  final bool premiumBannerIsHidden;
  final VoidCallback onBannerHide;
  final VoidCallback onLearnMore;

  const PremiumBannerTracks({
    required this.premiumBannerIsHidden,
    required this.onBannerHide,
    required this.onLearnMore,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;

    return premiumBannerIsHidden
        ? const SizedBox.shrink()
        : SizedBox(
            width: double.infinity,
            child: Stack(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PremiumBadge(
                            text: LocaleKeys.premium_goPremium.tr(),
                          ),
                          const SizedBox(height: 12),
                          for (final offer in PremiumConstants.premiumOffers)
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Text(
                                '• ${offer.tr()}',
                                style: theme.typography.bodyS.copyWith(
                                  color: theme.gray6,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                maxLines: 2,
                              ),
                            ),
                          const SizedBox(height: 32),
                          BWMActionButton(
                            title: LocaleKeys.premium_learnMore.tr(),
                            height: 36,
                            textColor: theme.primaryColor,
                            borderColor: theme.gray5,
                            overlayColor: Colors.white.withOpacity(0.2),
                            onPressed: onLearnMore,
                          ),
                        ],
                      ),
                    ),
                    const Image(
                      image: AssetImage(BWMAssets.premiumBannerIcon),
                    ),
                  ],
                ),
                Positioned.directional(
                  textDirection: Directionality.of(context),
                  top: 0,
                  end: 0,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: theme.primaryBackground.withOpacity(0.7),
                      borderRadius: const BorderRadiusDirectional.only(
                        bottomStart: Radius.circular(8),
                      ),
                    ),
                    child: IconButton(
                      color: Colors.white,
                      onPressed: onBannerHide,
                      icon: const Icon(Icons.close),
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
