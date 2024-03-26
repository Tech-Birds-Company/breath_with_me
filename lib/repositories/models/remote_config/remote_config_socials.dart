import 'package:json_annotation/json_annotation.dart';

part 'remote_config_socials.g.dart';

@JsonSerializable(createToJson: false)
class RemoteConfigSocials {
  final String communityDeeplink;
  final String communityDeeplinkEn;
  final String communityUrl;
  final String supportEmailDeeplink;

  const RemoteConfigSocials({
    this.communityDeeplink = 'tg://join?invite=2cWPyTpInQVlN2Ji',
    this.communityDeeplinkEn = 'tg://join?invite=LeXXI7lnykE3ZjZi',
    this.communityUrl = 'https://t.me/+2cWPyTpInQVlN2Ji',
    this.supportEmailDeeplink = 'mailto:support@breathewithme.app',
  });

  factory RemoteConfigSocials.fromJson(Map<String, dynamic> json) =>
      _$RemoteConfigSocialsFromJson(json);
}
