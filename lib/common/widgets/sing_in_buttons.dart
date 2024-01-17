import 'package:breathe_with_me/features/onboarding/widgets/sign_circle_button.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SingInWithButtons extends StatelessWidget {
  final VoidCallback onApplePressed;
  final VoidCallback onGooglePressed;

  const SingInWithButtons({
    required this.onApplePressed,
    required this.onGooglePressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return Center(
      child: Column(
        children: [
          Text(
            LocaleKeys.signInOrSignUp.tr(),
            style: theme.typography.bodyMTrue.copyWith(
              color: theme.gray3,
            ),
          ),
          const SizedBox(height: 16),
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
            ],
          ),
        ],
      ),
    );
  }
}
