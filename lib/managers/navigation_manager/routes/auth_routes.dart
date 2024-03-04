import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/features/forgot_password/forgot_password_page.dart';
import 'package:breathe_with_me/features/forgot_password/reset_password_page.dart';
import 'package:breathe_with_me/features/sign_in/sign_in_page.dart';
import 'package:breathe_with_me/features/sign_up/sign_up_page.dart';
import 'package:breathe_with_me/features/sign_up/sign_up_success.dart';
import 'package:breathe_with_me/managers/navigation_manager/bwm_transparent_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// enum _Mode {
//   resetPassword('resetPassword');

//   final String key;

//   const _Mode(this.key);
// }

class AuthRoutes {
  const AuthRoutes();

  String get signIn => _signInPath;

  String get signUp => _signUpPath;

  String get forgotPassword => _forgotPasswordPath;

  String get successSignUp => _successSignUp;
  String get resetPassword => _resetPasswordPath;

  static const _signInPath = '/sign-in';
  static const _signUpPath = '/sign-up';
  static const _forgotPasswordPath = '/forgot-password';
  static const _successSignUp = '/success-sign-up';
  static const _resetPasswordPath = '/reset-password';

  List<GoRoute> createAuthRoutes() => [
        GoRoute(
          path: _signInPath,
          builder: (context, state) => Consumer(
            builder: (context, ref, child) => SignInPage(
              bloc: ref.watch(Di.bloc.signIn),
            ),
          ),
        ),
        GoRoute(
          path: _signUpPath,
          builder: (context, state) => Consumer(
            builder: (context, ref, child) => SignUpPage(
              bloc: ref.watch(Di.bloc.signUp),
            ),
          ),
        ),
        GoRoute(
          path: _forgotPasswordPath,
          builder: (context, state) => Consumer(
            builder: (context, ref, child) => ForgotPasswordPage(
              bloc: ref.watch(Di.bloc.forgotPassword),
            ),
          ),
        ),
        GoRoute(
          path: _successSignUp,
          pageBuilder: (context, state) => TransparentPage(
            child: Consumer(
              builder: (context, ref, child) => SighUpSuccess(
                navigationManager: ref.watch(Di.manager.navigation),
              ),
            ),
          ),
        ),
        GoRoute(
          path: _resetPasswordPath,
          builder: (context, state) => Consumer(
            builder: (context, ref, child) {
              final oobCode = state.uri.queryParameters['oobCode'];
              if (oobCode != null) {
                return ResetPasswordPage(
                  bloc: ref.watch(Di.bloc.resetPassword(oobCode)),
                );
              } else {
                throw AssertionError('oobCode is null');
              }
            },
          ),
        ),
      ];
}
