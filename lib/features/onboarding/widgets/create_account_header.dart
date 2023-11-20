import 'package:breathe_with_me/features/onboarding/widgets/sign_circle_button.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CreateAccountHeader extends StatelessWidget {
  final VoidCallback onApplePressed;
  final VoidCallback onGooglePressed;
  final VoidCallback onEmailPressed;
  final VoidCallback onLoginPressed;

  const CreateAccountHeader({
    required this.onApplePressed,
    required this.onGooglePressed,
    required this.onEmailPressed,
    required this.onLoginPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Center(
        child: Column(
          children: [
            Text(
              LocaleKeys.createAccountHeaderTitle.tr().toUpperCase(),
              style: theme.typography.heading.copyWith(
                color: Colors.white,
                letterSpacing: 0.6,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SignCircleButton(
                  provider: SignCircleButtonProvider.apple,
                  onPressed: onApplePressed,
                ),
                const SizedBox(width: 12),
                SignCircleButton(
                  provider: SignCircleButtonProvider.google,
                  onPressed: onGooglePressed,
                ),
                const SizedBox(width: 12),
                SignCircleButton(
                  provider: SignCircleButtonProvider.email,
                  onPressed: onEmailPressed,
                ),
              ],
            ),
            const SizedBox(height: 23),
            Text(
              LocaleKeys.createAccountHeaderConjunction.tr(),
              style: theme.typography.bodyM.copyWith(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              LocaleKeys.createAccountHeaderSubtitle.tr().toUpperCase(),
              textAlign: TextAlign.center,
              style: theme.typography.bodyMTrue.copyWith(
                color: Colors.white,
                height: 1.8,
              ),
            ),
            const SizedBox(height: 40),
            TextButton(
              onPressed: onLoginPressed,
              style: TextButton.styleFrom(shape: const StadiumBorder()),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  LocaleKeys.createAccountHeaderLogin.tr(),
                  style: theme.typography.bodyM.copyWith(
                    color: theme.secondaryColor,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}