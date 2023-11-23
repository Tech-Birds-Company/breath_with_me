import 'dart:async';

import 'package:breathe_with_me/features/onboarding/models/onboarding_state.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/managers/user_manager/user_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class OnboardingBloc extends BlocBase<OnboardingState> {
  final NavigationManager _navigationManager;
  final UserManager _userManager;

  OnboardingBloc(
    this._navigationManager,
    this._userManager,
  ) : super(const OnboardingState());

  Future<void> signUpWithApple() async {
    await _userManager.signInWithApple();
  }

  Future<void> signUpWithGoogle() async {
    await _userManager.signInWithGoogle();
  }

  Future<void> signUpWithEmail() async {
    // TODO(bestk1ngarthur): Open email sign up flow
    _openHome();
  }

  Future<void> signIn() async {
    // TODO(bestk1ngarthur): Open sign in flow
    _openHome();
  }

  void openContactUs() {
    // TODO(bestk1ngarthur): Open contact us
    _openHome();
  }

  void closeCreateAccountModal() {
    _navigationManager.router.pop();
  }

  void _openHome() {
    _navigationManager.replaceHome();
  }
}
