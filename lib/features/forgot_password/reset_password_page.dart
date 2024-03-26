import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/common/widgets/bwm_action_button.dart';
import 'package:breathe_with_me/common/widgets/bwm_app_bar.dart';
import 'package:breathe_with_me/common/widgets/obscured_field.dart';
import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:breathe_with_me/utils/analytics/bwm_analytics.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ResetPasswordPage extends HookConsumerWidget {
  final String oobCode;

  const ResetPasswordPage({
    required this.oobCode,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(
      () {
        BWMAnalytics.logScreenView('ResetPasswordPage');
        return null;
      },
      const [],
    );

    final theme = Theme.of(context).extension<BWMTheme>()!;
    final bloc = ref.watch(Di.bloc.resetPassword(oobCode));
    return Stack(
      children: [
        Scaffold(
          backgroundColor: theme.primaryBackground,
          appBar: BWMAppBar(
            title: LocaleKeys.resetPasswordTitle.tr(),
          ),
          body: Stack(
            children: [
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  LocaleKeys.resetPasswordSubtitle.tr(),
                  style: theme.typography.bodyS.copyWith(
                    color: theme.primaryColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const SizedBox(height: 46),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        ObscuredField(
                          hintText: LocaleKeys.signInPassword.tr(),
                          prefixIcon: BWMAssets.lockIcon,
                          textChange: bloc.updatePassword,
                        ),
                        ObscuredField(
                          hintText: LocaleKeys.confirmPassword.tr(),
                          prefixIcon: BWMAssets.lockIcon,
                          textChange: bloc.updateConfirmPassword,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    BWMActionButton(
                      title: LocaleKeys.resetPassword.tr(),
                      width: double.infinity,
                      height: 40,
                      onPressed: bloc.resetPassword,
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
