import 'package:breathe_with_me/repositories/firebase_remote_config_repository.dart';
import 'package:url_launcher/url_launcher.dart';

final class DeeplinkManager {
  final FirebaseRemoteConfigRepository _firebaseRemoteConfigRepository;

  const DeeplinkManager(this._firebaseRemoteConfigRepository);

  Future<void> onOpenPrivacyPolicy() async {
    final legalDocuments = _firebaseRemoteConfigRepository.legalDocuments;
    final uri = Uri.parse(legalDocuments.privacyPolicyUrl);
    final canLaunch = await canLaunchUrl(uri);
    if (canLaunch) {
      await launchUrl(uri);
    }
  }

  Future<void> onOpenTermsOfService() async {
    final legalDocuments = _firebaseRemoteConfigRepository.legalDocuments;
    final uri = Uri.parse(legalDocuments.termsOfServiceUrl);
    final canLaunch = await canLaunchUrl(uri);
    if (canLaunch) {
      await launchUrl(uri);
    }
  }

  Future<void> onComposeEmail() async {
    final socials = _firebaseRemoteConfigRepository.socials;
    final supportEmailDeeplink = Uri.parse(socials.supportEmailDeeplink);
    final canLaunch = await canLaunchUrl(supportEmailDeeplink);
    if (canLaunch) {
      await launchUrl(supportEmailDeeplink);
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
}
