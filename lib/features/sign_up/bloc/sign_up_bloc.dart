import 'package:breathe_with_me/extensions/string.dart';
import 'package:breathe_with_me/features/sign_up/models/sign_up_error.dart';
import 'package:breathe_with_me/features/sign_up/models/sign_up_state.dart';
import 'package:breathe_with_me/features/sign_up/models/sing_up_exception.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/managers/user_manager/user_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class SignUpBloc extends BlocBase<SignUpState> {
  final UserManager _userManager;
  final NavigationManager _navigationManager;

  SignUpBloc(
    this._userManager,
    this._navigationManager,
  ) : super(SignUpState());

  Future<void> signUpWithEmail() async {
    try {
      _validateInput();
      final result = await _userManager.signUpWithEmail(
        state.name,
        state.email,
        state.password,
      );

      if (result.isSuccess) {
        emit(state.copyWith(error: null));
        await _navigationManager.successPage();
      } else {
        emit(
          state.copyWith(
            error: SignUpError.firebase(result.errorMessage ?? ''),
          ),
        );
      }
    } on SignUpException catch (e) {
      emit(state.copyWith(error: e.error));
    }
  }

  Future<void> signUpWithApple() async {
    await _userManager.signInWithApple();
  }

  Future<void> signUpWithGoogle() async {
    await _userManager.signInWithGoogle();
  }

  void updateEmail(String email) => emit(state.copyWith(email: email));

  void updatePassword(String password) =>
      emit(state.copyWith(password: password));

  void updateName(String name) => emit(state.copyWith(name: name));

  void updatePasswordConfirm(String passwordConfirm) =>
      emit(state.copyWith(passwordConfirm: passwordConfirm));

  void _validateInput() {
    if (state.name.isEmpty) {
      throw const SignUpException(
        SignUpError.emptyName(),
      );
    }
    if (!state.email.isValidEmail) {
      throw const SignUpException(
        SignUpError.invalidEmail(),
      );
    }
    if (state.password != state.passwordConfirm) {
      throw const SignUpException(
        SignUpError.passwordMismatch(),
      );
    }
  }
}

extension SignUpErrorExtension on SignUpError {
  String get errorMessage => when(
        emptyName: () => LocaleKeys.signUpError_nameEmpty.tr(),
        invalidEmail: () => LocaleKeys.signUpError_emailEmpty.tr(),
        passwordMismatch: () => LocaleKeys.signUpError_passwordMatch.tr(),
        firebase: (message) => message,
      );
}
