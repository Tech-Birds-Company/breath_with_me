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
      backgroundColor: theme.primaryBackground,
      body: SafeArea(
        child: Stack(
          children: [
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
                child: SvgPicture.asset(
                  BWMAssets.close,
                  width: 16,
                  height: 16,
                ),
              ),
            ),
            Column(
              children: [
                const Spacer(),
                CreateAccountHeader(
                  onApplePressed: () {
                    _openHome(context);
                  },
                  onGooglePressed: () {
                    _openHome(context);
                  },
                  onEmailPressed: () {
                    _openHome(context);
                  },
                  onLoginPressed: () {
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
                        color: Colors.white,
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
                      color: Colors.white.withAlpha(60),
                    ),
                  ),
                ),
              ],
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
