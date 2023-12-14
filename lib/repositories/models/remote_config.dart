import 'package:breathe_with_me/repositories/models/remote_config_socials.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_config.freezed.dart';
part 'remote_config.g.dart';

@freezed
class RemoteConfig with _$RemoteConfig {
  const factory RemoteConfig({
    @Default(RemoteConfigSocials.defaultSocials) RemoteConfigSocials socials,
  }) = _RemoteConfig;

  factory RemoteConfig.fromJson(Map<String, dynamic> json) =>
      _$RemoteConfigFromJson(json);
}
