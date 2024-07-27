import 'package:breathe_with_me/database/schemas/bloc_state_schema.dart';
import 'package:breathe_with_me/database/schemas/download_track_task_schema.dart';
import 'package:breathe_with_me/database/schemas/liked_track_schema.dart';
import 'package:breathe_with_me/database/schemas/quotes_schema.dart';
import 'package:breathe_with_me/database/schemas/secure_image_url_schema.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

final class BWMDatabase {
  static const _databaseName = 'bwmdatabase';

  late Isar instance;

  Future<void> init() async {
    final dbDir = await getApplicationDocumentsDirectory();
    instance = await Isar.open(
      [
        BlocStateSchema,
        DownloadTrackTaskSchema,
        LikedTrackSchema,
        SecureImageUrlSchema,
        QuotesSchema,
      ],
      directory: dbDir.path,
      name: _databaseName,
    );
  }
}
