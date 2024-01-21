import 'package:breathe_with_me/features/profile/models/profile_state.dart';
import 'package:breathe_with_me/features/profile/models/profile_statistics_state.dart';
import 'package:breathe_with_me/features/streak/models/streak_statistics_data.dart';
import 'package:breathe_with_me/managers/database_manager/database_manager.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/managers/permissions_manager/permissions_manager.dart';
import 'package:breathe_with_me/managers/push_notifications/push_notifications_manager.dart';
import 'package:breathe_with_me/managers/subscriptions_manager/subscriptions_manager.dart';
import 'package:breathe_with_me/managers/user_manager/user_manager.dart';
import 'package:breathe_with_me/repositories/firebase_remote_config_repository.dart';
import 'package:breathe_with_me/repositories/streaks_progress_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

final class ProfileBloc extends BlocBase<ProfileState> {
  final NavigationManager _navigationManager;
  final PushNotificationsManager _pushNotificationsManager;
  final PermissionsManager _permissionsManager;
  final FirebaseRemoteConfigRepository _firebaseRemoteConfigRepository;
  final UserManager _userManager;
  final DatabaseManager _databaseManager;
  final SubscriptionsManager _subscriptionsManager;
  final StreaksProgressRepository _streaksProgressRepository;

  ProfileBloc(
    this._navigationManager,
    this._pushNotificationsManager,
    this._permissionsManager,
    this._firebaseRemoteConfigRepository,
    this._userManager,
    this._databaseManager,
    this._subscriptionsManager,
    this._streaksProgressRepository,
  ) : super(const ProfileState(ProfileStatisticsState.empty()));

  String get username {
    final currentUser = _userManager.currentUser;
    return currentUser?.displayName ?? '';
  }

  bool get premiumEnabled => _subscriptionsManager.premiumEnabled;

  String? get premiumEndDate =>
      _subscriptionsManager.customerInfo?.latestExpirationDate;

  Future<void> updateStatistics() async {
    final userID = _userManager.currentUser?.uid;
    if (userID != null) {
      if (premiumEnabled) {
        final monthLivesCount =
            _firebaseRemoteConfigRepository.streaks.monthLivesCount;
        final streaksProgress = await _streaksProgressRepository
            .getStreaksProgress(userID, monthLivesCount);
        final streakStatistics = StreakStatisticsData.full(
          streaksProgress.lastStreaksCount,
          streaksProgress.practicesCount,
          streaksProgress.minutesCount,
        );
        emit(
          ProfileState(
            ProfileStatisticsState.streakStatistics(streakStatistics),
          ),
        );
      } else {
        emit(const ProfileState(ProfileStatisticsState.premiumOffer()));
      }
    } else {
      emit(const ProfileState(ProfileStatisticsState.empty()));
    }
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
