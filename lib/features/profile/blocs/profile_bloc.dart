import 'package:breathe_with_me/managers/database_manager/database_manager.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/managers/permissions_manager/permissions_manager.dart';
import 'package:breathe_with_me/managers/push_notifications/push_notifications_manager.dart';
import 'package:breathe_with_me/managers/user_manager/user_manager.dart';
import 'package:breathe_with_me/repositories/firebase_remote_config_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

final class ProfileBloc extends BlocBase<Object?> {
  final NavigationManager _navigationManager;
  final PushNotificationsManager _pushNotificationsManager;
  final PermissionsManager _permissionsManager;
  final FirebaseRemoteConfigRepository _firebaseRemoteConfigRepository;
  final UserManager _userManager;
  final DatabaseManager _databaseManager;

  ProfileBloc(
    this._navigationManager,
    this._pushNotificationsManager,
    this._permissionsManager,
    this._firebaseRemoteConfigRepository,
    this._userManager,
    this._databaseManager,
  ) : super(null);

  String get username {
    final currentUser = _userManager.currentUser;
    return currentUser?.displayName ?? '';
  }

  Future<void> openReminder() async {
    final permissionGranted =
        await _permissionsManager.requestPushNotificationsPermissions();
    if (permissionGranted ?? false) {
      _navigationManager.openReminderPage();
    } else {
      await _pushNotificationsManager.openPushNotificationsSettings();
    }
  }

  Future<void> openCommunityChat() async {
    final socials = _firebaseRemoteConfigRepository.socials;
    final communityDeeplink = Uri.parse(socials.communityDeeplink);
    final communityUrl = Uri.parse(socials.communityUrl);
    final canLaunch = await canLaunchUrl(communityDeeplink);
    if (canLaunch) {
      await launchUrl(communityDeeplink);
    } else {
      await launchUrl(communityUrl);
    }
  }

  Future<void> onSupportEmail() async {
    final socials = _firebaseRemoteConfigRepository.socials;
    final supportEmailDeeplink = Uri.parse(socials.supportEmailDeeplink);
    final canLaunch = await canLaunchUrl(supportEmailDeeplink);
    if (canLaunch) {
      await launchUrl(supportEmailDeeplink);
    }
  }

  void openLanguageSheet() {
    if (_navigationManager.context == null) {
      return;
    }
    _navigationManager.openLanguageSheet();
  }

  void openFaq() => _navigationManager.openFaq();

  Future<void> onSignOut() async {
    await _userManager.signOut();
    await _databaseManager.clearDb();
  }

  void openProfileSettings() => _navigationManager.openProfileSettings();
}
