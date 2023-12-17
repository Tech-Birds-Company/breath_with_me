import 'dart:ui';

import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/common/widgets/bwm_action_button.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ForgotPasswordEmailSendedWidget extends StatelessWidget {
  final VoidCallback onOpenEmailTap;
  final VoidCallback onTryAgainTap;

  const ForgotPasswordEmailSendedWidget({
    required this.onOpenEmailTap,
    required this.onTryAgainTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 5,
        sigmaY: 5,
      ),
      child: ColoredBox(
        color: Colors.black.withOpacity(0.4),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 1),
              SvgPicture.asset(
                width: 88,
                height: 88,
                BWMAssets.email,
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  theme.gray6,
                  BlendMode.srcIn,
                ),
              ),
              Text(
                LocaleKeys.checkYourEmail.tr(),
                textAlign: TextAlign.center,
                style: theme.typography.heading2.copyWith(
                  color: theme.primaryColor,
                  decoration: TextDecoration.none,
                ),
              ),
              const SizedBox(height: 28),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 41),
                child: Text(
                  LocaleKeys.checkYourEmailSubtitle.tr(),
                  textAlign: TextAlign.center,
                  style: theme.typography.bodyM.copyWith(
                    color: theme.subtitleText,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              const SizedBox(height: 44),
              BWMActionButton(
                title: LocaleKeys.openEmailApp.tr(),
                width: 153,
                height: 40,
                onPressed: onOpenEmailTap,
              ),
              const Spacer(flex: 3),
              TextButton(
                onPressed: onTryAgainTap,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 108),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: LocaleKeys.forgotPasswordSpamFirst.tr(),
                          style: theme.typography.bodyM.copyWith(
                            color: theme.gray4,
                          ),
                        ),
                        TextSpan(
                          text: LocaleKeys.forgotPasswordSpamSecond.tr(),
                          style: theme.typography.bodyM.copyWith(
                            color: theme.green3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
