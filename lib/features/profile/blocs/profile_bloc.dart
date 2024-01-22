import 'dart:async';

import 'package:breathe_with_me/features/profile/models/profile_state.dart';
import 'package:breathe_with_me/features/profile/models/profile_statistics_state.dart';
import 'package:breathe_with_me/features/streak/models/streak_statistics_data.dart';
import 'package:breathe_with_me/managers/database_manager/database_manager.dart';
import 'package:breathe_with_me/managers/deeplink_manager/deeplink_manager.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/managers/permissions_manager/permissions_manager.dart';
import 'package:breathe_with_me/managers/push_notifications/push_notifications_manager.dart';
import 'package:breathe_with_me/managers/subscriptions_manager/subscriptions_manager.dart';
import 'package:breathe_with_me/managers/user_manager/user_manager.dart';
import 'package:breathe_with_me/repositories/firebase_remote_config_repository.dart';
import 'package:breathe_with_me/repositories/streaks_progress_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class ProfileBloc extends BlocBase<ProfileState> {
  final NavigationManager _navigationManager;
  final PushNotificationsManager _pushNotificationsManager;
  final PermissionsManager _permissionsManager;
  final FirebaseRemoteConfigRepository _firebaseRemoteConfigRepository;
  final UserManager _userManager;
  final DatabaseManager _databaseManager;
  final SubscriptionsManager _subscriptionsManager;
  final StreaksProgressRepository _streaksProgressRepository;
  final DeeplinkManager _deepLinkManager;

  ProfileBloc(
    this._navigationManager,
    this._pushNotificationsManager,
    this._permissionsManager,
    this._firebaseRemoteConfigRepository,
    this._userManager,
    this._databaseManager,
    this._subscriptionsManager,
    this._streaksProgressRepository,
    this._deepLinkManager,
  ) : super(const ProfileState(ProfileStatisticsState.empty()));

  String get username {
    final currentUser = _userManager.currentUser;
    return currentUser?.displayName ?? '';
  }

  Stream<bool> get premiumEnabledStream =>
      _subscriptionsManager.premiumEnabledStream;

  bool get _premiumEnabled => _subscriptionsManager.premiumEnabled;

  String? get premiumEndDate => _subscriptionsManager
      .customerInfo?.entitlements.active.values.firstOrNull?.expirationDate;

  StreamSubscription<bool>? _premiumEnabledSubscription;

  Future<void> init() async {
    await _updateStatistics();
    _premiumEnabledSubscription ??= premiumEnabledStream.listen(
      (_) => _updateStatistics(),
    );
  }

  Future<void> _updateStatistics() async {
    final userId = _userManager.currentUser?.uid;
    if (userId == null) {
      emit(
        const ProfileState(
          ProfileStatisticsState.empty(),
        ),
      );
      return;
    }
    if (_premiumEnabled) {
      final monthLivesCount =
          _firebaseRemoteConfigRepository.streaks.monthLivesCount;
      final streaksProgress = await _streaksProgressRepository
          .getStreaksProgress(userId, monthLivesCount);
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
      emit(
        const ProfileState(
          ProfileStatisticsState.premiumOffer(),
        ),
      );
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
    await _databaseManager.clearDb();
  }

  void dispose() {
    _premiumEnabledSubscription?.cancel();
    _premiumEnabledSubscription = null;
  }
}
