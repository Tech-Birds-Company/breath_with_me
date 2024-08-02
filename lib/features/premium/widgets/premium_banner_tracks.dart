import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/features/premium/premium_constants.dart';
import 'package:breathe_with_me/features/premium/widgets/premium_badge.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PremiumBannerTracks extends StatelessWidget {
  const PremiumBannerTracks({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
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
                    ],
                  ),
                ),
                const Image(
                  image: AssetImage(BWMAssets.premiumBannerIcon),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
