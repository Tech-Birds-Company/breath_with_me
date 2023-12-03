import 'dart:ui';

import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/features/onboarding/widgets/create_account_header.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// TODO(bestk1ngarthur): Hide apple sign if anavailable

class CreateAccountModalPage extends ConsumerWidget {
  const CreateAccountModalPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.read(Di.shared.bloc.onboarding);
    final theme = Theme.of(context).extension<BWMTheme>()!;
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
                  onEmailPressed: () {
                    // TODO(bestk1ngarthur): code
                  },
                  onLoginPressed: () {
                    // TODO(bestk1ngarthur): code
                  },
                ),
                const Spacer(),
                TextButton(
                  style: TextButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: const Color(0x24BDD6E9),
                  ),
                  onPressed: () {
                    // TODO(bestk1ngarthur): code
                  },
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
                  child: Text(
                    LocaleKeys.createAccountAgreement.tr(),
                    textAlign: TextAlign.center,
                    style: theme.typography.footer.copyWith(
                      color: theme.primaryText.withAlpha(80),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
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
