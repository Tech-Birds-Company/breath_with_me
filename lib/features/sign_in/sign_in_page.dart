import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/design/button_with_colored_border.dart';
import 'package:breathe_with_me/design/obscured_field.dart';

import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SignInPageWidget extends StatelessWidget {
  const SignInPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginScreen();
  }
}

// наследовать от HoooConsumerWidjet
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final blok = ref.read(DI.)
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Spacer(),
            const Text(
              LocaleKeys.welcomeBack,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 54),
            ObscuredField(
              hintText: LocaleKeys.signInEmail.tr(),
              prefixIcon: BWMAssets.emailIcon,
            ),
            const SizedBox(height: 20),
            ObscuredField(
              hintText: LocaleKeys.signInPassword.tr(),
              prefixIcon: BWMAssets.lockIcon,
              enableObscuredTextToggle: true,
            ),
            const SizedBox(height: 30),
            ButtonWithColoredBorder(
              text: LocaleKeys.signInLogin.tr(),
              borderColor: theme.secondaryColor,
              onTap: () {},
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // Handle forgot password logic here
              },
              child: Text(
                LocaleKeys.signInForgotPass,
                style: TextStyle(color: theme.secondaryColor),
              ),
            ),
            const Spacer(),
            Align(
              // TODO(musa): заменить на темин CreateAccountHeader.
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 78),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Add this line
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(LocaleKeys.signInOrSignUp,
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.apple, color: Colors.white),
                          onPressed: () {
                            // Handle login with Apple logic here
                          },
                        ),
                        const SizedBox(width: 20),
                        IconButton(
                          icon: const Icon(Icons.circle,
                              color: Colors
                                  .white), // Note: You'll need a custom Google icon here
                          onPressed: () {
                            // Handle login with Google logic here
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
