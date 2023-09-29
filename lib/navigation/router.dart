import 'package:breath_with_me/features/onboarding/onboarding_page.dart';
import 'package:breath_with_me/navigation/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class BWMRouter {
  const BWMRouter._();

  static final router = GoRouter(
    initialLocation: BWMRoutes.onboarding,
    routes: <RouteBase>[
      GoRoute(
        path: BWMRoutes.onboarding,
        builder: (BuildContext context, GoRouterState state) {
          return const OnboardingPage();
        },
      ),
    ],
  );
}
