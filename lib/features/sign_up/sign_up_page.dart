import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/common/widgets/bwm_action_button.dart';
import 'package:breathe_with_me/common/widgets/bwm_app_bar.dart';
import 'package:breathe_with_me/common/widgets/keyboard_hider.dart';
import 'package:breathe_with_me/common/widgets/obscured_field.dart';
import 'package:breathe_with_me/common/widgets/sing_in_buttons.dart';
import 'package:breathe_with_me/features/sign_up/bloc/sign_up_bloc.dart';
import 'package:breathe_with_me/features/sign_up/models/sign_up_error.dart';
import 'package:breathe_with_me/features/sign_up/models/sign_up_state.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:breathe_with_me/utils/analytics/bwm_analytics.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SignUpPage extends HookWidget {
  final SignUpBloc bloc;

  const SignUpPage({
    required this.bloc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    final appBar = BWMAppBar(
      title: LocaleKeys.welcomeBreather.tr(),
    );

    useEffect(
      () {
        BWMAnalytics.logScreenView('SignUpPage');
        return null;
      },
      const [],
    );

    return KeyboardHider(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: theme.primaryBackground,
        appBar: appBar,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 64),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  ObscuredField(
                    hintText: LocaleKeys.yourName.tr(),
                    prefixIcon: BWMAssets.profileIcon,
                    textChange: bloc.updateName,
                  ),
                  ObscuredField(
                    hintText: LocaleKeys.signInEmail.tr(),
                    prefixIcon: BWMAssets.email,
                    textChange: bloc.updateEmail,
                  ),
                  ObscuredField(
                    hintText: LocaleKeys.signInPassword.tr(),
                    prefixIcon: BWMAssets.lockIcon,
                    enableObscuredTextToggle: true,
                    textChange: bloc.updatePassword,
                  ),
                  ObscuredField(
                    hintText: LocaleKeys.confirmPassword.tr(),
                    prefixIcon: BWMAssets.lockIcon,
                    enableObscuredTextToggle: true,
                    textChange: bloc.updatePasswordConfirm,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              BWMActionButton(
                title: LocaleKeys.createAccountSignUpButtonTitle.tr(),
                width: double.infinity,
                height: 40,
                onPressed: bloc.signUpWithEmail,
              ),
              BlocSelector<SignUpBloc, SignUpState, SignUpError?>(
                bloc: bloc,
                selector: (state) => state.error,
                builder: (context, error) {
                  if (error case final errorMessage?) {
                    return SizedBox(
                      height: 67,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            errorMessage.errorMessage,
                            style: theme.typography.footer
                                .copyWith(color: theme.red),
                          ),
                        ),
                      ),
                    );
                  }
                  return const SizedBox(height: 64);
                },
              ),
              SingInWithButtons(
                onApplePressed: bloc.signUpWithApple,
                onGooglePressed: bloc.signUpWithGoogle,
              ),
              // const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
