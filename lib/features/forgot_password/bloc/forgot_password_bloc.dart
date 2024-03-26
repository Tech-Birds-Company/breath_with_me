import 'package:breathe_with_me/extensions/string.dart';
import 'package:breathe_with_me/features/forgot_password/models/forgot_password_state.dart';
import 'package:breathe_with_me/managers/deeplink_manager/deeplink_manager.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/managers/user_manager/user_manager.dart';
import 'package:breathe_with_me/utils/analytics/bwm_analytics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class ForgotPasswordBloc extends BlocBase<ForgotPasswordState> {
  final UserManager _userManager;
  final DeeplinkManager _deeplinkManager;
  final NavigationManager _navigationManager;

  ForgotPasswordBloc(
    this._userManager,
    this._deeplinkManager,
    this._navigationManager,
  ) : super(const ForgotPasswordState());

  String? get currentEmail => _userManager.currentUser?.email;

  void updateEmail(String email) => emit(state.copyWith(email: email));

  Future<void> resetPassword() async {
    if (!state.email.isValidEmail) {
      return;
    }
    await _userManager.sendResetPassword(state.email);
    BWMAnalytics.event(
      'onRestorePasswordEmailSent',
      params: {'email': state.email},
    );
    await _navigationManager.openPasswordEmailSent();
  }

  Future<void> openEmailApp() => _deeplinkManager.onComposeEmail();
}
