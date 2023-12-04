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

  void onOpenCreateAccountModal() {
    _navigationManager.openCreateAccount();
  }

  void onCloseCreateAccountModal() {
    _navigationManager.router.pop();
  }
}
