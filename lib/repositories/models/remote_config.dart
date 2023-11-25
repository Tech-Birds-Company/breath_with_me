import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_config.freezed.dart';
part 'remote_config.g.dart';

@freezed
class RemoteConfig with _$RemoteConfig {
  static const defaultConfig = RemoteConfig(
    communityDeeplink: 'tg://join?invite=2cWPyTpInQVlN2Ji',
    supportEmailDeeplink: 'mailto:support@breathewithme.app',
  );

  const factory RemoteConfig({
    required String communityDeeplink,
    required String supportEmailDeeplink,
  }) = _RemoteConfig;

  factory RemoteConfig.fromJson(Map<String, dynamic> json) =>
      _$RemoteConfigFromJson(json);
}
