import 'package:breathe_with_me/features/forgot_password/models/reset_password_state.dart';
import 'package:breathe_with_me/managers/user_manager/user_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class ResetPasswordBloc extends BlocBase<ResetPasswordState> {
  ResetPasswordBloc(
    this._userManager,
    String oodCode,
  ) : super(ResetPasswordState(oodCode: oodCode));

  final UserManager _userManager;

  void updatePassword(String password) =>
      emit(state.copyWith(password: password));
  void updateConfirmPassword(String password) =>
      emit(state.copyWith(confirmPassword: password));

  Future<void> resetPassword() async {
    await _userManager.resetPassword(state.oodCode, state.password);
  }
}
