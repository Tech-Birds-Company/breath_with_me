import 'package:objectbox/objectbox.dart';

@Entity()
class SecureImageUrlEntity {
  @Id()
  int id = 0;

  String baseUrl;
  String secureUrl;

  SecureImageUrlEntity({
    required this.baseUrl,
    required this.secureUrl,
  });
}
