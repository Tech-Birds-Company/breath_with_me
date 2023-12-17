import 'package:freezed_annotation/freezed_annotation.dart';

part 'legal_documents.g.dart';

@JsonSerializable()
class LegalDocuments {
  final String privacyPolicyUrl;
  final String termsOfServiceUrl;

  const LegalDocuments({
    this.privacyPolicyUrl = 'https://breathewithme.app/privacypolicy',
    this.termsOfServiceUrl =
        'https://drive.google.com/file/d/1ESZt6YCUZFP1ZBvis6YjQzqTx0aLTKKj/view',
  });

  factory LegalDocuments.fromJson(Map<String, dynamic> json) =>
      _$LegalDocumentsFromJson(json);

  Map<String, dynamic> toJson() => _$LegalDocumentsToJson(this);
}
