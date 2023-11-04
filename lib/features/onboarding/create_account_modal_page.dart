import 'dart:ui';
import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/features/onboarding/widgets/create_account_header.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/managers/navigation_manager/routes.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class CreateAccountModalPage extends StatelessWidget {
  const CreateAccountModalPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
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
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(
                  color: Colors.black.withAlpha(60),
                ),
              ),
            ),
            Column(
              children: [
                const Spacer(),
                CreateAccountHeader(
                  onApplePressed: () {
                    // TODO(bestk1ngarthur): Auth with Apple
                    _openHome(context);
                  },
                  onGooglePressed: () {
                    // TODO(bestk1ngarthur): Auth with Google
                    _openHome(context);
                  },
                  onEmailPressed: () {
                    // TODO(bestk1ngarthur): Open email flow
                    _openHome(context);
                  },
                  onLoginPressed: () {
                    // TODO(bestk1ngarthur): Open login flow
                    _openHome(context);
                  },
                ),
                const Spacer(),
                TextButton(
                  style: TextButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: const Color.fromRGBO(189, 214, 233, 0.14),
                  ),
                  onPressed: () {
                    _openHome(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      LocaleKeys.createAccountContact.tr(),
                      style: theme.typography.bodyMTrue.copyWith(
                        color: theme.primaryText,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
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
                onPressed: () {
                  Navigator.pop(context);
                },
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

  void _openHome(BuildContext context) {
    context.pushReplacement(BWMRoutes.home);
  }
}
