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

  late final _redirectRoutes = {
    BWMRoutes.onboarding,
    BWMRoutes.createAccount,
    BWMRoutes.auth.signIn,
    BWMRoutes.auth.signUp,
  };

  void init() => _userSubscription ??= _userManager.userStream.listen(
        (user) {
          if (context == null) {
            return;
          }
          if (user != null) {
            final routeMatch =
                router.routerDelegate.currentConfiguration.matches.lastOrNull;
            final path = routeMatch?.matchedLocation;
            if (path == null || _redirectRoutes.contains(path)) {
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
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final authorized = _userManager.currentUser != null;
      if (authorized) {
        if (_redirectRoutes.contains(state.uri.path)) {
          return BWMRoutes.home;
        }
      }
      return null;
    },
  );

  Future<void> openTrackPlayer(Track track) async {
    final uri = Uri(path: BWMRoutes.player);
    await router.push(
      uri.toString(),
      extra: track,
    );
  }

  Future<void> openLanguageSheet() => router.push(BWMRoutes.languageSheet);

  Future<void> openReminderPage() => router.push(BWMRoutes.reminderPage);

  Future<void> openProfile() => router.push(BWMRoutes.profile);

  Future<void> openProfileSettings() => router.push(BWMRoutes.profileSettings);

  Future<void> openSafetyPrecautions() =>
      router.push(BWMRoutes.safetyPrecautions);

  Future<void> openCreateAccount() => router.push(BWMRoutes.createAccount);

  Future<void> openFiltersSheet(FilterType filterType) => router.push(
        BWMRoutes.filtersSheet,
        extra: filterType,
      );

  Future<void> openFaq() => router.push(BWMRoutes.faq);

  Future<void> openStreak() => router.push(BWMRoutes.streak);

  Future<void> singUpPage() => router.push(BWMRoutes.auth.signUp);

  Future<void> singInPage() => router.push(BWMRoutes.auth.signIn);

  Future<void> successPage() => router.push(BWMRoutes.auth.successSignUp);

  Future<void> forgotPasswordPage() =>
      router.push(BWMRoutes.auth.forgotPassword);

  Future<void> openPasswordEmailSent() =>
      router.push(BWMRoutes.passwordEmailSent);

  Future<void> resetPassword(String query) =>
      router.push('${BWMRoutes.auth.resetPassword}?$query');

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
}
