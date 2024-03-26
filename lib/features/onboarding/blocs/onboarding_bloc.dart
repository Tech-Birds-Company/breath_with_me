import 'dart:async';

import 'package:breathe_with_me/features/onboarding/models/onboarding_state.dart';
import 'package:breathe_with_me/managers/deeplink_manager/deeplink_manager.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/managers/user_manager/user_manager.dart';
import 'package:breathe_with_me/utils/analytics/bwm_analytics.dart';
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

  Future<void> signUpWithApple() async {
    BWMAnalytics.event('onboardingSignUpWithApple');
    await _userManager.signInWithApple();
  }

  Future<void> signUpWithGoogle() async {
    BWMAnalytics.event('onboardingSignUpWithGoogle');
    await _userManager.signInWithGoogle();
  }

  Future<void> onOpenCreateAccountModal() async {
    BWMAnalytics.event('onboardingOnOpenCreateAccountModal');
    await _navigationManager.openCreateAccount();
  }

  Future<void> onOpenPrivacyPolicy() async {
    BWMAnalytics.event('onboardingOnOpenPrivacyPolicy');
    await _deeplinkManager.onOpenPrivacyPolicy();
  }

  Future<void> onOpenTermsOfService() async {
    BWMAnalytics.event('onboardingOnOpenTermsOfService');
    await _deeplinkManager.onOpenTermsOfService();
  }

  void onCloseCreateAccountModal() {
    BWMAnalytics.event('onboardingOnCloseCreateAccountModal');
    _navigationManager.pop();
  }

  Future<void> signUpWithEmail() async {
    BWMAnalytics.event('onboardingSignUpWithEmail');
    await _navigationManager.singUpPage();
  }

  Future<void> signIn() async {
    BWMAnalytics.event('onboardingSignIn');
    await _navigationManager.singInPage();
  }

  Future<void> onOpenContactUs() async {
    BWMAnalytics.event('onboardingOnOpenContactUs');
    await _deeplinkManager.onComposeEmail();
  }
}
