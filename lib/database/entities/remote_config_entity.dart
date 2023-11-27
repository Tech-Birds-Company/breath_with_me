import 'package:objectbox/objectbox.dart';

@Entity()
class RemoteConfigEntity {
  @Id()
  int id = 0;

  String json;

  RemoteConfigEntity({
    required this.json,
  });
}
