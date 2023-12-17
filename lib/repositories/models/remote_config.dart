import 'package:breathe_with_me/repositories/models/legal_documents.dart';
import 'package:breathe_with_me/repositories/models/remote_config_socials.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_config.g.dart';

@JsonSerializable()
class RemoteConfig {
  final RemoteConfigSocials socials;
  @JsonKey(name: 'legal_documents')
  final LegalDocuments legalDocuments;

  const RemoteConfig({
    this.socials = const RemoteConfigSocials(),
    this.legalDocuments = const LegalDocuments(),
  });

  factory RemoteConfig.fromJson(Map<String, dynamic> json) =>
      _$RemoteConfigFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteConfigToJson(this);
}
