import 'dart:async';

import 'package:breathe_with_me/features/onboarding/models/onboarding_state.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/managers/user_manager/user_manager.dart';
import 'package:breathe_with_me/repositories/models/remote_config.dart';
import 'package:breathe_with_me/repositories/remote_config_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

final class OnboardingBloc extends BlocBase<OnboardingState> {
  final NavigationManager _navigationManager;
  final UserManager _userManager;
  final RemoteConfigRepository<RemoteConfig> _remoteConfigRepository;

  OnboardingBloc(
    this._navigationManager,
    this._userManager,
    this._remoteConfigRepository,
  ) : super(const OnboardingState());

  Future<void> signUpWithApple() => _userManager.signInWithApple();

  Future<void> signUpWithGoogle() => _userManager.signInWithGoogle();

  void onOpenCreateAccountModal() => _navigationManager.openCreateAccount();

  Future<void> onOpenPrivacyPolicy() async {
    final config = await _remoteConfigRepository.getRemoteConfig();
    final uri = Uri.parse(config.legalDocuments.privacyPolicyUrl);
    await launchUrl(uri);
  }

  Future<void> onOpenTermsOfService() async {
    final config = await _remoteConfigRepository.getRemoteConfig();
    final uri = Uri.parse(config.legalDocuments.termsOfServiceUrl);
    await launchUrl(uri);
  }

  void onCloseCreateAccountModal() => _navigationManager.router.pop();
}
