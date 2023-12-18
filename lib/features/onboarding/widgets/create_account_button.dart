import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OnboardingCreateAccountButton extends StatelessWidget {
  final VoidCallback onTap;
  const OnboardingCreateAccountButton({
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: ColoredBox(
          color: theme.secondaryColor,
          child: SizedBox(
            width: 208,
            height: 44,
            child: Center(
              child: Text(
                LocaleKeys.onboardingCreateAccount.tr(),
                style: theme.typography.bodyMTrue.copyWith(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
