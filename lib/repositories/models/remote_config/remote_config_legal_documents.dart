import 'package:json_annotation/json_annotation.dart';

part 'remote_config_legal_documents.g.dart';

@JsonSerializable(createToJson: false)
class RemoteConfigLegalDocuments {
  final String privacyPolicyUrl;
  final String termsOfServiceUrl;

  const RemoteConfigLegalDocuments({
    this.privacyPolicyUrl =
        'https://drive.google.com/file/d/1xZ0_3upIQDCkF1RjYoy-64Mt6rfn-qWd/view',
    this.termsOfServiceUrl =
        'https://drive.google.com/file/d/1ESZt6YCUZFP1ZBvis6YjQzqTx0aLTKKj/view',
  });

  factory RemoteConfigLegalDocuments.fromJson(Map<String, dynamic> json) =>
      _$RemoteConfigLegalDocumentsFromJson(json);
}
