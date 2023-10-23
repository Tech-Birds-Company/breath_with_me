import 'package:objectbox/objectbox.dart';

@Entity()
class BlocStateEntity {
  @Id()
  int id = 0;

  @Unique()
  String key;

  String json;

  BlocStateEntity({
    required this.key,
    required this.json,
  });
}
