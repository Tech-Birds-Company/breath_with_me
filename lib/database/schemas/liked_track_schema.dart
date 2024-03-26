import 'package:isar/isar.dart';

part 'liked_track_schema.g.dart';

@collection
final class LikedTrack {
  Id? id;
  @Index(unique: true, replace: true, type: IndexType.hash)
  String trackId;

  LikedTrack({required this.trackId});
}
