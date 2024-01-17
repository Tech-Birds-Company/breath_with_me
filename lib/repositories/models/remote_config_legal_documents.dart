import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_config_legal_documents.g.dart';

@JsonSerializable(createToJson: false)
class RemoteConfigLegalDocuments {
  final String privacyPolicyUrl;
  final String termsOfServiceUrl;

  const RemoteConfigLegalDocuments({
    this.privacyPolicyUrl = 'https://breathewithme.app/privacypolicy',
    this.termsOfServiceUrl =
        'https://drive.google.com/file/d/1ESZt6YCUZFP1ZBvis6YjQzqTx0aLTKKj',
  });

  factory RemoteConfigLegalDocuments.fromJson(Map<String, dynamic> json) =>
      _$RemoteConfigLegalDocumentsFromJson(json);
}
