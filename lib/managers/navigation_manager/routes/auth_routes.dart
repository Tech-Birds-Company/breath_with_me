import 'package:breathe_with_me/di/di.dart';
import 'package:breathe_with_me/features/forgot_password/forgot_password_page.dart';
import 'package:breathe_with_me/features/sign_in/sign_in_page.dart';
import 'package:breathe_with_me/features/sign_up/sign_up_page.dart';
import 'package:breathe_with_me/features/sign_up/sign_up_success.dart';
import 'package:breathe_with_me/managers/navigation_manager/bwm_transparent_page.dart';
import 'package:breathe_with_me/utils/dependency_provider.dart';
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
          builder: (context, state) => DependencyProvider(
            provider: Di.bloc.signIn,
            builder: (context, dependency) => SignInPageWidget(
              bloc: dependency,
            ),
          ),
        ),
        GoRoute(
          path: _signUpPath,
          builder: (context, state) => DependencyProvider(
            provider: Di.bloc.signUp,
            builder: (context, dependency) => SignUpPage(
              bloc: dependency,
            ),
          ),
        ),
        GoRoute(
          path: _forgotPasswordPath,
          builder: (context, state) => DependencyProvider(
            provider: Di.bloc.forgotPassword,
            builder: (context, dependency) =>
                ForgotPasswordPage(bloc: dependency),
          ),
        ),
        GoRoute(
          path: _successSignUp,
          pageBuilder: (context, state) => TransparentPage(
            child: DependencyProvider(
              provider: Di.manager.navigation,
              builder: (context, dependency) => SighUpSuccess(
                navigationManager: dependency,
              ),
            ),
          ),
        ),
        GoRoute(
          path: _successSignUp,
          pageBuilder: (context, state) => TransparentPage(
            child: DependencyProvider(
              provider: Di.manager.navigation,
              builder: (context, dependency) => SighUpSuccess(
                navigationManager: dependency,
              ),
            ),
          ),
        ),
      ];
}
