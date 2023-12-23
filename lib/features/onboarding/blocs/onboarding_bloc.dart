import 'dart:async';

import 'package:breathe_with_me/features/onboarding/models/onboarding_state.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/managers/user_manager/user_manager.dart';
import 'package:breathe_with_me/repositories/firebase_remote_config_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

final class OnboardingBloc extends BlocBase<OnboardingState> {
  final NavigationManager _navigationManager;
  final UserManager _userManager;
  final FirebaseRemoteConfigRepository _remoteConfigRepository;

  OnboardingBloc(
    this._navigationManager,
    this._userManager,
    this._remoteConfigRepository,
  ) : super(const OnboardingState());

  Future<void> signUpWithApple() => _userManager.signInWithApple();

  Future<void> signUpWithGoogle() => _userManager.signInWithGoogle();

  void onOpenCreateAccountModal() => _navigationManager.openCreateAccount();

  Future<void> onOpenPrivacyPolicy() async {
    final legalDocuments = _remoteConfigRepository.legalDocuments;
    final uri = Uri.parse(legalDocuments.privacyPolicyUrl);
    await launchUrl(uri);
  }

  Future<void> onOpenTermsOfService() async {
    final legalDocuments = _remoteConfigRepository.legalDocuments;
    final uri = Uri.parse(legalDocuments.termsOfServiceUrl);
    await launchUrl(uri);
  }

  void onCloseCreateAccountModal() => _navigationManager.router.pop();

  void signUpWithEmail() {
    _navigationManager.singUpPage();
  }

  void signIn() {
    _navigationManager.singInPage();
  }
}
