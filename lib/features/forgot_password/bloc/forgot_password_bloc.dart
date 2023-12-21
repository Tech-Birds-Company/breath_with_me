import 'package:breathe_with_me/features/forgot_password/models/forgot_password_state.dart';
import 'package:breathe_with_me/managers/user_manager/user_manager.dart';
import 'package:breathe_with_me/repositories/firebase_remote_config_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

final class ForgotPasswordBloc extends BlocBase<ForgotPasswordState> {
  ForgotPasswordBloc(
    this._userManager,
    this._firebaseRemoteConfigRepository,
  ) : super(const ForgotPasswordState());

  final UserManager _userManager;
  final FirebaseRemoteConfigRepository _firebaseRemoteConfigRepository;

  void updateEmail(String email) => emit(state.copyWith(email: email));

  Future<void> resetPassword() async {
    await _userManager.sendResetPassword(state.email);
    emit(state.copyWith(requestSended: true));
  }

  void tryAnotherEmail() {
    emit(state.copyWith(requestSended: false));
  }

  Future<void> openEmailApp() async {
    final socials = _firebaseRemoteConfigRepository.socials;
    final supportEmailDeeplink = Uri.parse(socials.supportEmailDeeplink);
    final canLaunch = await canLaunchUrl(supportEmailDeeplink);
    if (canLaunch) {
      await launchUrl(supportEmailDeeplink);
    }
  }
}
