import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/common/widgets/bwm_action_button.dart';
import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class ForgotPasswordEmailSentPage extends ConsumerWidget {
  const ForgotPasswordEmailSentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    final deeplinkManager = ref.watch(Di.manager.deeplink);
    final navigationManager = ref.watch(Di.manager.navigation);
    return ColoredBox(
      color: Colors.black.withOpacity(0.85),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Align(
                alignment: AlignmentDirectional.topEnd,
                child: IconButton(
                  onPressed: navigationManager.pop,
                  icon: Icon(
                    Icons.close,
                    color: theme.primaryColor,
                    size: 20,
                  ),
                ),
              ),
            ),
            const Spacer(),
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
              onPressed: deeplinkManager.onComposeEmail,
            ),
            const Spacer(flex: 3),
            Padding(
              padding: const EdgeInsets.all(20),
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
                      recognizer: TapGestureRecognizer()
                        ..onTap = navigationManager.pop,
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
