import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:breathe_with_me/features/profile_settings/models/profile_settings_state.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/managers/user_manager/user_manager.dart';
import 'package:breathe_with_me/utils/analytics/bwm_analytics.dart';
import 'package:breathe_with_me/utils/logger.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class ProfileSettingsBloc extends BlocBase<ProfileSettingsState> {
  final UserManager _userManager;
  final NavigationManager _navigationManager;

  ProfileSettingsBloc(
    this._userManager,
    this._navigationManager,
  ) : super(
          ProfileSettingsState(
            initialName: _userManager.currentUser?.displayName ?? '',
            name: _userManager.currentUser?.displayName ?? '',
            email: _userManager.currentUser?.email ?? '',
          ),
        );

  Future<void> openForgotPassword() => _navigationManager.forgotPasswordPage();

  void onEmailChange(String text) => emit(state.copyWith(email: text));

  void onNameChange(String text) => emit(state.copyWith(name: text));

  Future<void> onSave() async {
    final currentName = state.initialName;
    try {
      emit(state.copyWith(initialName: state.name));
      await _userManager.updateAccountSettings(
        state.name,
        state.email,
      );
    } on Exception catch (e) {
      BWMAnalytics.event(
        'onProfileSettingsSaveNameError',
        params: {
          'error': e.toString(),
        },
      );
      emit(
        state.copyWith(
          initialName: currentName,
          name: currentName,
        ),
      );
    }
  }

  Future<void> onDeleteAccount() async {
    final context = _navigationManager.context;
    if (context != null) {
      if (context.mounted) {
        final result = await showOkCancelAlertDialog(
          context: context,
          title: LocaleKeys.profileDeleteAccountDialog_title.tr(),
          message: LocaleKeys.profileDeleteAccountDialog_message.tr(),
          barrierDismissible: false,
          isDestructiveAction: true,
          useActionSheetForIOS: true,
          okLabel: LocaleKeys.profileDeleteAccountDialog_ok.tr(),
        );
        if (result == OkCancelResult.ok) {
          try {
            await _userManager.deleteAccount();
          } on FirebaseAuthException catch (e) {
            logger.e(e.message);
            if (context.mounted) {
              await showOkAlertDialog(
                context: context,
                title: LocaleKeys.profileDeleteAccountDialog_oldAuthErrorTitle
                    .tr(),
                message: LocaleKeys
                    .profileDeleteAccountDialog_oldAuthErrorMessage
                    .tr(),
              );
            }
          }
        }
      }
    }
  }
}
