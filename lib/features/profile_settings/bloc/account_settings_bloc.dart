import 'package:breathe_with_me/features/profile_settings/models/account_settings_state.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/managers/user_manager/user_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class AccountSettingsBloc extends BlocBase<AccountSettingsState> {
  final UserManager _userManager;
  final NavigationManager _navigationManager;

  AccountSettingsBloc(
    this._userManager,
    this._navigationManager,
  ) : super(
          AccountSettingsState(
            name: _userManager.currentUser?.displayName ?? '',
            email: _userManager.currentUser?.email ?? '',
          ),
        );

  void openForgotPassword() {
    _navigationManager.forgotPasswordPage();
  }

  void onEmailChange(String text) {
    emit(state.copyWith(email: text));
  }

  void onNameChange(String text) {
    emit(state.copyWith(name: text));
  }

  void onSave() {
    _userManager.updateAccountSettings(state.name, state.email);
  }
}
