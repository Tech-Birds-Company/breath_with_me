import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/common/widgets/bwm_action_button.dart';
import 'package:breathe_with_me/common/widgets/bwm_app_bar.dart';
import 'package:breathe_with_me/common/widgets/keyboard_hider.dart';
import 'package:breathe_with_me/common/widgets/obscured_field.dart';
import 'package:breathe_with_me/common/widgets/sing_in_buttons.dart';
import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    final bloc = ref.watch(Di.bloc.signIn);
    return KeyboardHider(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: theme.primaryBackground,
        appBar: BWMAppBar(
          title: LocaleKeys.welcomeBack.tr(),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 64),
              ObscuredField(
                hintText: LocaleKeys.signInEmail.tr(),
                prefixIcon: BWMAssets.emailIcon,
                textChange: bloc.onEmailChange,
              ),
              const SizedBox(height: 16),
              ObscuredField(
                hintText: LocaleKeys.signInPassword.tr(),
                prefixIcon: BWMAssets.lockIcon,
                enableObscuredTextToggle: true,
                textChange: bloc.onChangePassword,
              ),
              const SizedBox(height: 16),
              BWMActionButton(
                title: LocaleKeys.signInLogin.tr(),
                width: double.infinity,
                height: 40,
                onPressed: bloc.signIn,
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: bloc.openForgotPassword,
                child: Text(
                  LocaleKeys.signInForgotPass.tr(),
                  style: TextStyle(color: theme.secondaryColor),
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
    );
  }
}
