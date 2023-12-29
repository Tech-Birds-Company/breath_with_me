import 'package:isar/isar.dart';

part 'bloc_state_schema.g.dart';

@collection
final class BlocState {
  Id? id;
  @Index(unique: true, replace: true, type: IndexType.hash)
  String key;
  String json;

  BlocState({
    required this.key,
    required this.json,
  });
}
