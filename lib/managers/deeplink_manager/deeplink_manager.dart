import 'dart:ui';

import 'package:breathe_with_me/repositories/firebase_remote_config_repository.dart';
import 'package:breathe_with_me/utils/analytics/bwm_analytics.dart';
import 'package:url_launcher/url_launcher.dart';

final class DeeplinkManager {
  final FirebaseRemoteConfigRepository _firebaseRemoteConfigRepository;

  const DeeplinkManager(this._firebaseRemoteConfigRepository);

  Future<void> _launchUri(Uri uri, {Uri? onFailUri}) async {
    final canLaunch = await canLaunchUrl(uri);
    if (canLaunch) {
      BWMAnalytics.event(
        'onDeeplinkLaunch',
        params: {
          'deeplink': uri.toString(),
        },
      );
      await launchUrl(uri);
    } else {
      final canLaunchOnFail =
          onFailUri != null && await canLaunchUrl(onFailUri);
      if (canLaunchOnFail) {
        BWMAnalytics.event(
          'onDeeplinkLaunch',
          params: {
            'deeplink': onFailUri.toString(),
          },
        );
        await launchUrl(onFailUri);
      }
    }
  }

  Future<void> onOpenPrivacyPolicy() async {
    final legalDocuments = _firebaseRemoteConfigRepository.legalDocuments;
    final uri = Uri.parse(legalDocuments.privacyPolicyUrl);
    await _launchUri(uri);
  }

  Future<void> onOpenTermsOfService() async {
    final legalDocuments = _firebaseRemoteConfigRepository.legalDocuments;
    final uri = Uri.parse(legalDocuments.termsOfServiceUrl);
    await _launchUri(uri);
  }

  Future<void> onComposeEmail() async {
    final socials = _firebaseRemoteConfigRepository.socials;
    final uri = Uri.parse(socials.supportEmailDeeplink);
    await _launchUri(uri);
  }

  Future<void> openCommunityChat(Locale locale) async {
    final socials = _firebaseRemoteConfigRepository.socials;
    final communityDeeplinkUri = Uri.parse(
      locale == const Locale('ru')
          ? socials.communityDeeplink
          : socials.communityDeeplinkEn,
    );
    final communityUri = Uri.parse(socials.communityUrl);
    await _launchUri(
      communityDeeplinkUri,
      onFailUri: communityUri,
    );
  }
}
