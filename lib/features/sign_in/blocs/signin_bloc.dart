import 'dart:async';

import 'package:breathe_with_me/features/sign_in/models/singin_state.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/managers/user_manager/user_manager.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:breathe_with_me/utils/logger.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
    try {
      await _userManager.signInWithEmail(state.email, state.password);
    } on FirebaseAuthException catch (e, s) {
      final context = _navigationManager.context;
      if (context != null && context.mounted) {
        final theme = Theme.of(context).extension<BWMTheme>()!;
        final sb = SnackBar(
          backgroundColor: theme.red,
          elevation: 0,
          padding: const EdgeInsets.all(16),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(8),
            ),
          ),
          content: Row(
            children: [
              const Icon(Icons.error),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  LocaleKeys.signInErrorMessage.tr(),
                  style: theme.typography.labelM
                      .copyWith(color: theme.primaryText),
                ),
              ),
            ],
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(sb);
      }

      logger.e(e, stackTrace: s);
    }
  }

  Future<void> openForgotPassword() async {
    await _navigationManager.forgotPasswordPage();
  }

  void onEmailChange(String text) {
    emit(state.copyWith(email: text));
  }

  void onChangePassword(String text) {
    emit(state.copyWith(password: text));
  }
}
