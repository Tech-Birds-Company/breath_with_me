import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/common/widgets/bwm_action_button.dart';
import 'package:breathe_with_me/common/widgets/bwm_app_bar.dart';
import 'package:breathe_with_me/common/widgets/keyboard_hider.dart';
import 'package:breathe_with_me/common/widgets/obscured_field.dart';
import 'package:breathe_with_me/common/widgets/sing_in_buttons.dart';
import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/extensions/string.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:breathe_with_me/utils/analytics/bwm_analytics.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInPage extends HookConsumerWidget {
  const SignInPage({super.key});

  static final _signInFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    final bloc = ref.watch(Di.bloc.signIn);

    useEffect(
      () {
        BWMAnalytics.logScreenView('SignInPage');
        return null;
      },
      const [],
    );

    return KeyboardHider(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: theme.primaryBackground,
        appBar: BWMAppBar(
          title: LocaleKeys.welcomeBack.tr(),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _signInFormKey,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 64),
                ObscuredField(
                  hintText: LocaleKeys.signInEmail.tr(),
                  prefixIcon: BWMAssets.email,
                  textChange: bloc.onEmailChange,
                  validator: (value) {
                    if (value == null || value.isEmpty || !value.isValidEmail) {
                      return LocaleKeys.signInEmailError.tr();
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ObscuredField(
                  hintText: LocaleKeys.signInPassword.tr(),
                  prefixIcon: BWMAssets.lockIcon,
                  enableObscuredTextToggle: true,
                  textChange: bloc.onChangePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 6) {
                      return LocaleKeys.signInPasswordError.tr();
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                BWMActionButton(
                  title: LocaleKeys.signInLogin.tr(),
                  width: double.infinity,
                  height: 40,
                  onPressed: () {
                    final formIsValid = _signInFormKey.currentState?.validate();
                    if (formIsValid ?? false) {
                      FocusScope.of(context).unfocus();
                      bloc.signIn();
                    }
                  },
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: bloc.openForgotPassword,
                  child: Text(
                    LocaleKeys.signInForgotPass.tr(),
                    style: theme.typography.bodyM
                        .copyWith(color: theme.secondaryColor),
                  ),
                ),
                const Spacer(),
                SingInWithButtons(
                  onApplePressed: bloc.signUpWithApple,
                  onGooglePressed: bloc.signUpWithGoogle,
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
