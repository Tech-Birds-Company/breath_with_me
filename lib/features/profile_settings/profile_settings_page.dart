import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/common/widgets/bwm_action_button.dart';
import 'package:breathe_with_me/common/widgets/bwm_app_bar.dart';
import 'package:breathe_with_me/common/widgets/keyboard_hider.dart';
import 'package:breathe_with_me/common/widgets/obscured_field.dart';
import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/features/profile_settings/bloc/profile_settings_bloc.dart';
import 'package:breathe_with_me/features/profile_settings/models/profile_settings_state.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:breathe_with_me/utils/analytics/bwm_analytics.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileSettingsPage extends HookConsumerWidget {
  const ProfileSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    final bloc = ref.watch(Di.bloc.accountSettings);

    useEffect(
      () {
        BWMAnalytics.logScreenView('ProfileSettingsPage');
        return null;
      },
      const [],
    );

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
                children: <Widget>[
                  const SizedBox(height: 24),
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
                  BlocSelector<ProfileSettingsBloc, ProfileSettingsState, bool>(
                    bloc: bloc,
                    selector: (state) => state.name != state.initialName,
                    builder: (context, nameChanged) {
                      if (nameChanged) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 24),
                          child: BWMActionButton(
                            title: LocaleKeys.reminderSaveButtonTitle.tr(),
                            width: double.infinity,
                            height: 40,
                            onPressed: bloc.onSave,
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                  TextButton(
                    onPressed: bloc.openForgotPassword,
                    child: Text(
                      LocaleKeys.resetPassword.tr(),
                      style: theme.typography.bodyM
                          .copyWith(color: theme.secondaryColor),
                    ),
                  ),
                  ListTile(
                    minLeadingWidth: 0,
                    horizontalTitleGap: 8,
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      Icons.delete,
                      color: theme.red,
                    ),
                    title: Text(
                      LocaleKeys.profileDeleteAccount.tr(),
                      style: theme.typography.bodyM.copyWith(
                        color: theme.primaryText,
                      ),
                    ),
                    onTap: bloc.onDeleteAccount,
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
