import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/design/button_with_colored_border.dart';
import 'package:breathe_with_me/design/obscured_field.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              LocaleKeys.welcomeBreather.tr(),
              style: theme.typography.heading.copyWith(
                color: theme.primaryColor,
              ),
            ),
            const SizedBox(height: 54),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                ObscuredField(
                  hintText: LocaleKeys.yourName.tr(),
                  prefixIcon: BWMAssets.profileIcon,
                ),
                ObscuredField(
                  hintText: LocaleKeys.signInEmail.tr(),
                  prefixIcon: BWMAssets.emailIcon,
                ),
                ObscuredField(
                  hintText: LocaleKeys.signInPassword.tr(),
                  prefixIcon: BWMAssets.lockIcon,
                  enableObscuredTextToggle: true,
                ),
                ObscuredField(
                  hintText: LocaleKeys.confirmPassword.tr(),
                  prefixIcon: BWMAssets.lockIcon,
                  enableObscuredTextToggle: true,
                ),
              ],
            ),
            const SizedBox(height: 20),
            ButtonWithColoredBorder(
              text: LocaleKeys.onboardingCreateAccount.tr(),
              borderColor: theme.secondaryColor,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
