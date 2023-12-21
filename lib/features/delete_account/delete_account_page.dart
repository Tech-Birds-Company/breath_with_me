import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/extensions/widget.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DeleteAccountPage extends ConsumerWidget {
  const DeleteAccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    final bloc = ref.read(Di.shared.bloc.deleteAccount);
    return Scaffold(
      backgroundColor: theme.primaryBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              BWMAssets.deleteAccountIcon,
              width: 88,
              height: 88,
            ),
            Text(
              LocaleKeys.deleteAccountTitle.tr(),
              style: theme.typography.heading2.copyWith(
                color: theme.primaryText,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
              child: Text(
                LocaleKeys.deleteAccountDescription.tr(),
                textAlign: TextAlign.center,
                style: theme.typography.bodyMTrue.copyWith(
                  color: theme.primaryText,
                ),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                shape: const StadiumBorder(),
                backgroundColor: const Color(0x24BDD6E9),
              ),
              onPressed: bloc.cancelDeleting,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 65),
                child: Text(
                  LocaleKeys.cancel.tr(),
                  style: theme.typography.bodyMTrue.copyWith(
                    color: theme.primaryText,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: bloc.deleteAccount,
              child: Text(
                LocaleKeys.deleteAccountButton.tr(),
                style: theme.typography.bodyMTrue.copyWith(
                  color: theme.red,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
