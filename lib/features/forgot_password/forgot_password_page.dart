import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/common/widgets/bwm_action_button.dart';
import 'package:breathe_with_me/common/widgets/bwm_app_bar.dart';
import 'package:breathe_with_me/common/widgets/obscured_field.dart';
import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/features/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:breathe_with_me/features/forgot_password/models/forgot_password_state.dart';
import 'package:breathe_with_me/features/forgot_password/widgets/forgot_password_email_sended.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgotPasswordPage extends ConsumerWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    final bloc = ref.watch(Di.bloc.forgotPassword);
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
                          LocaleKeys.forgotPassword.tr(),
                          style: theme.typography.heading1.copyWith(
                            color: theme.primaryColor,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          LocaleKeys.forgotPassSubtitle.tr(),
                          style: theme.typography.bodyS.copyWith(
                            color: theme.primaryColor,
                          ),
                        ),
                        const SizedBox(height: 28),
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: [
                            ObscuredField(
                              hintText: LocaleKeys.signInEmail.tr(),
                              prefixIcon: BWMAssets.emailIcon,
                              textChange: bloc.updateEmail,
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
        BlocSelector<ForgotPasswordBloc, ForgotPasswordState, bool>(
          bloc: bloc,
          selector: (state) => state.requestSended,
          builder: (context, requestSended) {
            if (requestSended) {
              return SizedBox(
                child: ForgotPasswordEmailSendedWidget(
                  onOpenEmailTap: bloc.openEmailApp,
                  onTryAgainTap: bloc.tryAnotherEmail,
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
