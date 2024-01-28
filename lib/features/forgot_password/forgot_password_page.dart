import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/common/widgets/bwm_action_button.dart';
import 'package:breathe_with_me/common/widgets/bwm_app_bar.dart';
import 'package:breathe_with_me/common/widgets/keyboard_hider.dart';
import 'package:breathe_with_me/common/widgets/obscured_field.dart';
import 'package:breathe_with_me/features/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:breathe_with_me/features/forgot_password/models/forgot_password_state.dart';
import 'package:breathe_with_me/features/forgot_password/widgets/forgot_password_email_sent.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ForgotPasswordPage extends HookWidget {
  final ForgotPasswordBloc bloc;

  const ForgotPasswordPage({
    required this.bloc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;

    useEffect(
      () {
        bloc.updateEmail(bloc.currentEmail ?? '');
        return null;
      },
      const [],
    );

    return KeyboardHider(
      child: Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: theme.primaryBackground,
            // appBar: const BWMAppBar(),
            appBar: BWMAppBar(
              title: LocaleKeys.forgotPassword.tr(),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 32),
                  Text(
                    LocaleKeys.forgotPassSubtitle.tr(),
                    style: theme.typography.bodyS.copyWith(
                      color: theme.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      ObscuredField(
                        hintText: LocaleKeys.signInEmail.tr(),
                        prefixIcon: BWMAssets.emailIcon,
                        textChange: bloc.updateEmail,
                        defaultValue: bloc.currentEmail,
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
          ),
          BlocSelector<ForgotPasswordBloc, ForgotPasswordState, bool>(
            bloc: bloc,
            selector: (state) => state.requestSent,
            builder: (context, requestSent) {
              if (requestSent) {
                return SizedBox(
                  child: ForgotPasswordEmailSentWidget(
                    onOpenEmailTap: bloc.openEmailApp,
                    onTryAgainTap: bloc.tryAnotherEmail,
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
