import 'dart:async';

import 'package:breathe_with_me/managers/deeplink_manager/deeplink_manager.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/managers/permissions_manager/permissions_manager.dart';
import 'package:breathe_with_me/managers/premium_manager/premium_manager.dart';
import 'package:breathe_with_me/managers/push_notifications/push_notifications_manager.dart';
import 'package:breathe_with_me/managers/user_manager/user_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class ProfileBloc extends BlocBase<Object?> {
  final NavigationManager _navigationManager;
  final PushNotificationsManager _pushNotificationsManager;
  final PermissionsManager _permissionsManager;
  final UserManager _userManager;
  final PremiumManager _premiumManager;
  final DeeplinkManager _deepLinkManager;

  ProfileBloc(
    this._navigationManager,
    this._pushNotificationsManager,
    this._permissionsManager,
    this._userManager,
    this._premiumManager,
    this._deepLinkManager,
  ) : super(null);

  String get username {
    final currentUser = _userManager.currentUser;
    return currentUser?.displayName ?? '';
  }

  String? get premiumEndDate => _premiumManager.premiumEndDate;

  bool get isUserPremium => _premiumManager.isUserPremium;

  bool get premiumContentEnabled => _premiumManager.premiumContentEnabled;

  Stream<bool> get isPremiumUserStream => _premiumManager.isPremiumUserStream;

  Future<void> openReminder() async {
    final permissionGranted =
        await _permissionsManager.requestPushNotificationsPermissions();
    if (permissionGranted ?? false) {
      _navigationManager.openReminderPage();
    } else {
      await _pushNotificationsManager.openPushNotificationsSettings();
    }
  }

  Future<void> openCommunityChat() => _deepLinkManager.openCommunityChat();

  Future<void> onSupportEmail() => _deepLinkManager.onComposeEmail();

  void openLanguageSheet() {
    if (_navigationManager.context == null) {
      return;
    }
    _navigationManager.openLanguageSheet();
  }

  void openFaq() => _navigationManager.openFaq();

  void openProfileSettings() => _navigationManager.openProfileSettings();

  void openPremiumPaywall() => _navigationManager.openPremiumPaywall();

  Future<void> onSignOut() async {
    await _userManager.signOut();
  }
}
