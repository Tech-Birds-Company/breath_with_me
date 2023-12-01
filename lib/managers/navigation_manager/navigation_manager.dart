import 'package:breathe_with_me/features/profile/widgets/language_sheet.dart';
import 'package:breathe_with_me/managers/navigation_manager/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class NavigationManager {
  BuildContext? get context =>
      router.routerDelegate.navigatorKey.currentContext;

  late final router = GoRouter(
    initialLocation: BWMRoutes.onboarding,
    routes: BWMRoutes.routes,
  );

  void openTrackPlayer(String trackId) {
    final uri = Uri(
      path: BWMRoutes.player,
      queryParameters: {'trackId': trackId},
    );
    router.push(uri.toString());
  }

  void openLanguageSheet() {
    if (context == null) {
      return;
    }
    showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      context: context!,
      builder: (context) {
        return const LanguageSheet();
      },
    );
  }

  void openReminderPage() {
    router.push(BWMRoutes.reminderPage);
  }

  void openProfile() {
    router.push(BWMRoutes.profile);
  }

  void replaceHome() {
    router.pushReplacement(BWMRoutes.home);
  }
}
