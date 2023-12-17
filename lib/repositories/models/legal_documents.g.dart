// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'legal_documents.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LegalDocuments _$LegalDocumentsFromJson(Map json) => LegalDocuments(
      privacyPolicyUrl: json['privacyPolicyUrl'] as String? ??
          'https://breathewithme.app/privacypolicy',
      termsOfServiceUrl: json['termsOfServiceUrl'] as String? ??
          'https://drive.google.com/file/d/1ESZt6YCUZFP1ZBvis6YjQzqTx0aLTKKj/view',
    );

Map<String, dynamic> _$LegalDocumentsToJson(LegalDocuments instance) =>
    <String, dynamic>{
      'privacyPolicyUrl': instance.privacyPolicyUrl,
      'termsOfServiceUrl': instance.termsOfServiceUrl,
    };
