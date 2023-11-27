import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/repositories/firebase_remote_config_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

final class ProfileBloc extends BlocBase<Object?> {
  final NavigationManager _navigationManager;
  final FirebaseRemoteConfigRepository _firebaseRemoteConfigRepository;

  ProfileBloc(
    this._navigationManager,
    this._firebaseRemoteConfigRepository,
  ) : super(null);

  Future<void> openCommunityChat() async {
    final config = await _firebaseRemoteConfigRepository.getRemoteConfig();
    final communityDeeplink = Uri.parse(config.communityDeeplink);
    final canLaunch = await canLaunchUrl(communityDeeplink);
    if (canLaunch) {
      await launchUrl(communityDeeplink);
    }
  }

  Future<void> onSupportEmail() async {
    final config = await _firebaseRemoteConfigRepository.getRemoteConfig();
    final supportEmailDeeplink = Uri.parse(config.supportEmailDeeplink);
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
}
