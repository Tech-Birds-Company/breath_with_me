import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_config_socials.freezed.dart';
part 'remote_config_socials.g.dart';

@freezed
class RemoteConfigSocials with _$RemoteConfigSocials {
  static const defaultSocials = RemoteConfigSocials(
    communityDeeplink: 'tg://join?invite=2cWPyTpInQVlN2Ji',
    communityUrl: 'https://t.me/+2cWPyTpInQVlN2Ji',
    supportEmailDeeplink: 'mailto:support@breathewithme.app',
  );
  const factory RemoteConfigSocials({
    required String communityDeeplink,
    required String communityUrl,
    required String supportEmailDeeplink,
  }) = _RemoteConfigSocials;

  factory RemoteConfigSocials.fromJson(Map<String, dynamic> json) =>
      _$RemoteConfigSocialsFromJson(json);
}
