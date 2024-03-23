import 'package:breathe_with_me/features/profile_settings/models/profile_settings_state.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/managers/user_manager/user_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class ProfileSettingsBloc extends BlocBase<ProfileSettingsState> {
  final UserManager _userManager;
  final NavigationManager _navigationManager;

  ProfileSettingsBloc(
    this._userManager,
    this._navigationManager,
  ) : super(
          ProfileSettingsState(
            name: _userManager.currentUser?.displayName ?? '',
            email: _userManager.currentUser?.email ?? '',
          ),
        );

  Future<void> openForgotPassword() async {
    await _navigationManager.forgotPasswordPage();
  }

  void onEmailChange(String text) {
    emit(
      state.copyWith(
        email: text,
        isForgotPasswordButtonEnabled: true,
      ),
    );
  }

  void onNameChange(String text) {
    emit(
      state.copyWith(
        name: text,
        isForgotPasswordButtonEnabled: true,
      ),
    );
  }

  void onSave() => _userManager.updateAccountSettings(
        state.name,
        state.email,
      );
}
