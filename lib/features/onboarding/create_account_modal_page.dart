import 'package:breathe_with_me/features/onboarding/widgets/create_account_header.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class CreateAccountModalPage extends StatelessWidget {
  const CreateAccountModalPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      backgroundColor: theme.primaryBackground,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            const CreateAccountHeader(),
            const Spacer(),
            TextButton(
              style: TextButton.styleFrom(
                shape: const StadiumBorder(),
                backgroundColor: const Color.fromRGBO(189, 214, 233, 0.14),
              ),
              onPressed: () {
                // Add your button functionality here
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
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
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
      ),
    );
  }
}
