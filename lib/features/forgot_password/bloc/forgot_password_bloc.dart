import 'package:breathe_with_me/features/forgot_password/models/forgot_password_state.dart';
import 'package:breathe_with_me/managers/deeplink_manager/deeplink_manager.dart';
import 'package:breathe_with_me/managers/user_manager/user_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class ForgotPasswordBloc extends BlocBase<ForgotPasswordState> {
  final UserManager _userManager;
  final DeeplinkManager _deeplinkManager;

  ForgotPasswordBloc(
    this._userManager,
    this._deeplinkManager,
  ) : super(const ForgotPasswordState());

  void updateEmail(String email) => emit(state.copyWith(email: email));

  Future<void> resetPassword() async {
    await _userManager.sendResetPassword(state.email);
    emit(state.copyWith(requestSended: true));
  }

  void tryAnotherEmail() => emit(state.copyWith(requestSended: false));

  Future<void> openEmailApp() => _deeplinkManager.onComposeEmail();
}
