import 'package:breathe_with_me/features/forgot_password/models/reset_password_state.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/managers/user_manager/user_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class ResetPasswordBloc extends BlocBase<ResetPasswordState> {
  ResetPasswordBloc(
    this._userManager,
    this._navigationManager,
    String oodCode,
  ) : super(ResetPasswordState(oodCode: oodCode));

  final UserManager _userManager;
  final NavigationManager _navigationManager;

  void updatePassword(String password) =>
      emit(state.copyWith(password: password));
  void updateConfirmPassword(String password) =>
      emit(state.copyWith(confirmPassword: password));

  Future<void> resetPassword() async {
    await _userManager.resetPassword(state.oodCode, state.password);
    _navigationManager.pop();
  }
}
