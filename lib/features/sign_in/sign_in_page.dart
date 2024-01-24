import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/common/widgets/bwm_action_button.dart';
import 'package:breathe_with_me/common/widgets/bwm_app_bar.dart';
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
    return Scaffold(
      backgroundColor: theme.primaryBackground,
      appBar: const BWMAppBar(),
      body: SizedBox(
        height: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                theme.primaryBackground,
                Colors.black,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 79),
                Text(
                  LocaleKeys.welcomeBack.tr(),
                  style: theme.typography.heading1
                      .copyWith(color: theme.primaryText),
                ),
                const SizedBox(height: 54),
                ObscuredField(
                  hintText: LocaleKeys.signInEmail.tr(),
                  prefixIcon: BWMAssets.emailIcon,
                  textChange: bloc.onEmailChange,
                ),
                const SizedBox(height: 20),
                ObscuredField(
                  hintText: LocaleKeys.signInPassword.tr(),
                  prefixIcon: BWMAssets.lockIcon,
                  enableObscuredTextToggle: true,
                  textChange: bloc.onChangePassword,
                ),
                const SizedBox(height: 30),
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
      ),
    );
  }
}
