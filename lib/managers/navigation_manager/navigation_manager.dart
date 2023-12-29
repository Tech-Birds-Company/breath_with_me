import 'dart:async';

import 'package:breathe_with_me/features/tracks/filter_type.dart';
import 'package:breathe_with_me/features/tracks/models/track.dart';
import 'package:breathe_with_me/managers/navigation_manager/routes/routes.dart';
import 'package:breathe_with_me/managers/user_manager/user_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class NavigationManager {
  final UserManager _userManager;

  NavigationManager(this._userManager);

  BuildContext? get context =>
      router.routerDelegate.navigatorKey.currentContext;

  StreamSubscription<User?>? _userSubscription;

  void init() => _userSubscription ??= _userManager.userStream.listen(
        (user) {
          if (context == null) {
            return;
          }
          if (user != null) {
            final routeMatch =
                router.routerDelegate.currentConfiguration.matches.lastOrNull;
            final path = routeMatch?.matchedLocation;
            if (path == null ||
                path == BWMRoutes.onboarding ||
                path == BWMRoutes.createAccount ||
                path == BWMRoutes.auth.signIn ||
                path == BWMRoutes.auth.signUp) {
              popToRoot();
              router.pushReplacement(BWMRoutes.home);
            }
          } else {
            popToRoot();
            router.replace<void>(BWMRoutes.onboarding);
          }
        },
      );

  late final router = GoRouter(
    initialLocation: BWMRoutes.onboarding,
    routes: BWMRoutes.routes,
    redirect: (context, state) {
      final authorized = _userManager.currentUser != null;
      if (authorized) {
        if (state.uri.path == BWMRoutes.onboarding) {
          return BWMRoutes.home;
        }
      }

      return null;
    },
  );

  void openTrackPlayer(String trackId, {Track? track}) {
    final uri = Uri(
      path: BWMRoutes.player,
      queryParameters: {'trackId': trackId},
    );
    router.push(
      uri.toString(),
      extra: track,
    );
  }

  void openLanguageSheet() {
    if (context == null) {
      return;
    }
    router.push(BWMRoutes.languageSheet);
  }

  void openReminderPage() => router.push(BWMRoutes.reminderPage);

  void openProfile() => router.push(BWMRoutes.profile);

  void openSafetyPrecautions() => router.push(BWMRoutes.safetyPrecautions);

  void openCreateAccount() {
    if (context == null) {
      return;
    }

    router.push(BWMRoutes.createAccount);
  }

  Future<void> openFiltersSheet(FilterType filterType) => router.push(
        BWMRoutes.filtersSheet,
        extra: filterType,
      );

  void openFaq() => router.push(BWMRoutes.faq);

  void openStreak() => router.push(BWMRoutes.streak);

  void replaceHome() => router.pushReplacement(BWMRoutes.home);

  void pop() {
    if (router.canPop()) {
      router.pop();
    }
  }

  void popToRoot() {
    while (router.canPop()) {
      router.pop();
    }
  }

  void dispose() {
    _userSubscription?.cancel();
    _userSubscription = null;
  }

  void singUpPage() => router.push(BWMRoutes.auth.signUp);

  void singInPage() => router.push(BWMRoutes.auth.signIn);

  void forgotPasswordPage() => router.push(BWMRoutes.auth.forgotPassword);

  void successPage() => router.push(BWMRoutes.auth.successSignUp);
}
