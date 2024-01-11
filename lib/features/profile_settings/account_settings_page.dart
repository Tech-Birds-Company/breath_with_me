import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/common/widgets/bwm_action_button.dart';
import 'package:breathe_with_me/common/widgets/bwm_app_bar.dart';
import 'package:breathe_with_me/design/obscured_field.dart';
import 'package:breathe_with_me/features/profile_settings/bloc/account_settings_bloc.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AccountSettingsPage extends StatelessWidget {
  final AccountSettingsBloc bloc;

  const AccountSettingsPage({
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
                        const SizedBox(height: 28),
                        Text(
                          LocaleKeys.accountSetting.tr(),
                          style: theme.typography.heading1.copyWith(
                            color: theme.primaryColor,
                          ),
                        ),
                        const SizedBox(height: 40),
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: [
                            ObscuredField(
                              hintText: LocaleKeys.yourName.tr(),
                              prefixIcon: BWMAssets.profileIcon,
                              textChange: bloc.onNameChange,
                              defaultValue: bloc.state.name,
                            ),
                            ObscuredField(
                              hintText: LocaleKeys.signInEmail.tr(),
                              prefixIcon: BWMAssets.emailIcon,
                              textChange: bloc.onEmailChange,
                              defaultValue: bloc.state.email,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        BWMActionButton(
                          title: LocaleKeys.reminderSaveButtonTitle.tr(),
                          width: double.infinity,
                          height: 40,
                          onPressed: bloc.onSave,
                        ),
                        const SizedBox(height: 16),
                        TextButton(
                          onPressed: bloc.openForgotPassword,
                          child: Text(
                            LocaleKeys.resetPassword.tr(),
                            style: TextStyle(color: theme.secondaryColor),
                          ),
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
      ],
    );
  }
}
