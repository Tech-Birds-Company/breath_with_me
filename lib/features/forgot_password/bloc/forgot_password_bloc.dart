import 'package:breathe_with_me/features/forgot_password/models/forgot_password_state.dart';
import 'package:breathe_with_me/managers/user_manager/user_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class ForgotPasswordBloc extends BlocBase<ForgotPasswordState> {
  ForgotPasswordBloc(this._userManager) : super(const ForgotPasswordState());

  final UserManager _userManager;

  void updateEmail(String email) => emit(state.copyWith(email: email));

  Future<void> resetPassword() async {
    //await _userManager.sendResetPassword(state.email);
    emit(state.copyWith(requestSended: true));
  }

  void tryAnotherEmail() {
    emit(state.copyWith(requestSended: false));
  }

  void openEmailApp() {
    // TODO(musamuss): open email app
  }
}
