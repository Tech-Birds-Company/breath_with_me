import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PremiumPaywallButton extends StatelessWidget {
  final bool isProcessing;
  final VoidCallback? onPressed;

  const PremiumPaywallButton({
    this.onPressed,
    this.isProcessing = false,
    super.key,
  });

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
                backgroundColor: WidgetStateProperty.all(
                  theme.purple2.withOpacity(onPressed != null ? 1 : 0.3),
                ),
                foregroundColor: WidgetStateProperty.all(
                  theme.primaryText.withOpacity(onPressed != null ? 1 : 0.5),
                ),
                overlayColor: WidgetStateProperty.all(
                  theme.primaryText.withOpacity(0.1),
                ),
              ),
              onPressed: isProcessing ? null : onPressed,
              child: isProcessing
                  ? CircularProgressIndicator.adaptive(
                      backgroundColor: theme.primaryColor,
                    )
                  : Text(
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
