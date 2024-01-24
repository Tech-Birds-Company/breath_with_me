import 'package:breathe_with_me/features/forgot_password/forgot_password_page.dart';
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

  static const _signInPath = '/sign-in';
  static const _signUpPath = '/sign-up';
  static const _forgotPasswordPath = '/forgot-password';
  static const _successSignUp = '/success-sign-up';

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
          path: _successSignUp,
          pageBuilder: (context, state) => const TransparentPage(
            child: SighUpSuccess(),
          ),
        ),
      ];
}
