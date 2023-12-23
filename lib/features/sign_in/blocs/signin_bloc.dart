import 'dart:async';

import 'package:breathe_with_me/features/sign_in/models/singin_state.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/managers/user_manager/user_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class SignInBloc extends BlocBase<SignInState> {
  final NavigationManager _navigationManager;
  final UserManager _userManager;

  SignInBloc(
    this._navigationManager,
    this._userManager,
  ) : super(const SignInState());

  Future<void> signUpWithApple() async {
    await _userManager.signInWithApple();
  }

  Future<void> signUpWithGoogle() async {
    await _userManager.signInWithGoogle();
  }

  Future<void> signIn() async {
    await _userManager.signInWithEmail(state.email, state.password);
  }

  void openForgotPassword() {
    _navigationManager.forgotPasswordPage();
  }

  void onEmailChange(String text) {
    emit(state.copyWith(email: text));
  }

  void onChangePassword(String text) {
    emit(state.copyWith(password: text));
  }
}
