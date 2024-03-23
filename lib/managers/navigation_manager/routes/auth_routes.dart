import 'package:breathe_with_me/features/forgot_password/forgot_password_page.dart';
import 'package:breathe_with_me/features/forgot_password/reset_password_page.dart';
import 'package:breathe_with_me/features/sign_in/sign_in_page.dart';
import 'package:breathe_with_me/features/sign_up/sign_up_page.dart';
import 'package:breathe_with_me/features/sign_up/sign_up_success.dart';
import 'package:breathe_with_me/managers/navigation_manager/bwm_transparent_page.dart';
import 'package:go_router/go_router.dart';

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
          builder: (context, state) => const SignInPage(),
        ),
        GoRoute(
          path: _signUpPath,
          builder: (context, state) => const SignUpPage(),
        ),
        GoRoute(
          path: _forgotPasswordPath,
          builder: (context, state) => const ForgotPasswordPage(),
        ),
        GoRoute(
          path: _successSignUp,
          pageBuilder: (context, state) => const TransparentPage(
            child: SighUpSuccess(),
          ),
        ),
        GoRoute(
          path: _resetPasswordPath,
          builder: (context, state) {
            final oobCode = state.uri.queryParameters['oobCode'];
            if (oobCode != null) {
              return ResetPasswordPage(
                oobCode: oobCode,
              );
            } else {
              throw AssertionError('oobCode is null');
            }
          },
        ),
      ];
}
