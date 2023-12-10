import 'package:objectbox/objectbox.dart';

@Entity()
class LikedTracksEntity {
  @Id()
  int id = 0;

  List<String> likes;

  LikedTracksEntity({
    required this.likes,
    this.id = 0,
  });
}
