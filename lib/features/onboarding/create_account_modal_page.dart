import 'dart:ui';

import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/features/onboarding/widgets/create_account_header.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:breathe_with_me/utils/analytics/bwm_analytics.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreateAccountModalPage extends HookConsumerWidget {
  const CreateAccountModalPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(Di.bloc.onboarding);
    useEffect(
      () {
        BWMAnalytics.logScreenView('CreateAccountModalPage');
        return null;
      },
      const [],
    );

    final theme = Theme.of(context).extension<BWMTheme>()!;
    final locale = context.locale;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                BWMAssets.purpleFull,
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                child: ColoredBox(
                  color: Colors.black.withAlpha(60),
                ),
              ),
            ),
            Column(
              children: [
                const Spacer(),
                CreateAccountHeader(
                  onApplePressed: bloc.signUpWithApple,
                  onGooglePressed: bloc.signUpWithGoogle,
                  onEmailPressed: bloc.signUpWithEmail,
                  onLoginPressed: bloc.signIn,
                ),
                const Spacer(),
                TextButton(
                  style: TextButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: const Color(0x24BDD6E9),
                  ),
                  onPressed: bloc.onOpenContactUs,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      LocaleKeys.createAccountContact.tr(),
                      style: theme.typography.bodyMTrue.copyWith(
                        color: theme.primaryText,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 24,
                  ),
                  child: RichText(
                    locale: locale,
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: theme.typography.footer.copyWith(
                        color: theme.primaryText.withAlpha(80),
                      ),
                      children: [
                        TextSpan(
                          text: LocaleKeys.createAccountAgreement_part1.tr(),
                        ),
                        TextSpan(
                          text: LocaleKeys
                              .createAccountAgreement_privacyPolicyUrl
                              .tr(),
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = bloc.onOpenPrivacyPolicy,
                        ),
                        TextSpan(
                          text: LocaleKeys.createAccountAgreement_part2.tr(),
                        ),
                        TextSpan(
                          text: LocaleKeys
                              .createAccountAgreement_termsOfServiceUrl
                              .tr(),
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = bloc.onOpenTermsOfService,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            PositionedDirectional(
              top: 0,
              end: 0,
              child: ElevatedButton(
                onPressed: bloc.onCloseCreateAccountModal,
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(20, 20),
                  shape: const CircleBorder(),
                  backgroundColor: Colors.transparent,
                ),
                child: const Icon(
                  Icons.close,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
