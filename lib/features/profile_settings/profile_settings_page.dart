import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/common/widgets/bwm_action_button.dart';
import 'package:breathe_with_me/common/widgets/bwm_app_bar.dart';
import 'package:breathe_with_me/common/widgets/keyboard_hider.dart';
import 'package:breathe_with_me/common/widgets/obscured_field.dart';
import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileSettingsPage extends ConsumerWidget {
  const ProfileSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    final bloc = ref.watch(Di.bloc.profileSettings);
    return KeyboardHider(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: theme.primaryBackground,
        appBar: BWMAppBar(
          title: LocaleKeys.accountSetting.tr(),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
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
                        editable: false,
                        prefixIcon: BWMAssets.email,
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
    );
  }
}
