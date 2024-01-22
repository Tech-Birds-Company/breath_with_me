import 'dart:async';

import 'package:breathe_with_me/features/onboarding/models/onboarding_state.dart';
import 'package:breathe_with_me/managers/deeplink_manager/deeplink_manager.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/managers/user_manager/user_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class OnboardingBloc extends BlocBase<OnboardingState> {
  final NavigationManager _navigationManager;
  final UserManager _userManager;
  final DeeplinkManager _deeplinkManager;

  OnboardingBloc(
    this._navigationManager,
    this._userManager,
    this._deeplinkManager,
  ) : super(const OnboardingState());

  Future<void> signUpWithApple() => _userManager.signInWithApple();

  Future<void> signUpWithGoogle() => _userManager.signInWithGoogle();

  void onOpenCreateAccountModal() => _navigationManager.openCreateAccount();

  Future<void> onOpenPrivacyPolicy() => _deeplinkManager.onOpenPrivacyPolicy();

  Future<void> onOpenTermsOfService() =>
      _deeplinkManager.onOpenTermsOfService();

  void onCloseCreateAccountModal() => _navigationManager.router.pop();

  void signUpWithEmail() => _navigationManager.singUpPage();

  void signIn() => _navigationManager.singInPage();

  Future<void> onOpenContactUs() => _deeplinkManager.onComposeEmail();
}
