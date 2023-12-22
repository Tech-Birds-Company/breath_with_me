import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PremiumPaywallButton extends StatelessWidget {
  const PremiumPaywallButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return SafeArea(
      child: Align(
        alignment: AlignmentDirectional.center,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: SizedBox(
            width: 310,
            height: 44,
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  theme.purple2,
                ),
                foregroundColor: MaterialStateProperty.all(
                  theme.primaryText,
                ),
                overlayColor: MaterialStateProperty.all(
                  theme.primaryText.withOpacity(0.1),
                ),
              ),
              onPressed: () {},
              child: Text(
                LocaleKeys.premium_buyPremium.tr(),
                style: theme.typography.bodyMTrue,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
