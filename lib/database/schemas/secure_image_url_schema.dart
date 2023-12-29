import 'package:isar/isar.dart';

part 'secure_image_url_schema.g.dart';

@collection
class SecureImageUrl {
  Id? id;
  @Index(unique: true, replace: true, type: IndexType.hash)
  String baseUrl;
  String secureUrl;

  SecureImageUrl({
    required this.baseUrl,
    required this.secureUrl,
  });
}
