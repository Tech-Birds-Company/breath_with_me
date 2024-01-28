import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/common/widgets/bwm_action_button.dart';
import 'package:breathe_with_me/common/widgets/bwm_app_bar.dart';
import 'package:breathe_with_me/common/widgets/obscured_field.dart';
import 'package:breathe_with_me/features/forgot_password/bloc/reset_password_block.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ResetPasswordPage extends StatelessWidget {
  final ResetPasswordBloc bloc;

  const ResetPasswordPage({
    required this.bloc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return Stack(
      children: [
        Scaffold(
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
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        const SizedBox(height: 79),
                        Text(
                          LocaleKeys.resetPasswordTitle.tr(),
                          style: theme.typography.heading1.copyWith(
                            color: theme.primaryColor,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          LocaleKeys.resetPasswordSubtitle.tr(),
                          style: theme.typography.bodyS.copyWith(
                            color: theme.primaryColor,
                          ),
                        ),
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
          ),
        ),
        // BlocSelector<ForgotPasswordBloc, ForgotPasswordState, bool>(
        //   bloc: bloc,
        //   selector: (state) => state.requestSended,
        //   builder: (context, requestSended) {
        //     if (requestSended) {
        //       return SizedBox(
        //         child: ForgotPasswordEmailSendedWidget(
        //           onOpenEmailTap: bloc.openEmailApp,
        //           onTryAgainTap: bloc.tryAnotherEmail,
        //         ),
        //       );
        //     }
        //     return const SizedBox.shrink();
        //   },
        // ),
      ],
    );
  }
}
