import 'package:breathe_with_me/objectbox.g.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

final class BWMDatabase {
  static const _databaseName = 'bwmdatabase';
  final Store store;

  const BWMDatabase._create(this.store);

  static Future<BWMDatabase> init() async {
    final cacheDir = await getApplicationCacheDirectory();
    final store = await openStore(
      directory: join(cacheDir.path, _databaseName),
    );
    return BWMDatabase._create(store);
  }
}
