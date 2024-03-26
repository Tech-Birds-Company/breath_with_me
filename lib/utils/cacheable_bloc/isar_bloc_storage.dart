import 'dart:convert';

import 'package:breathe_with_me/database/schemas/bloc_state_schema.dart';
import 'package:breathe_with_me/managers/database_manager/database_manager.dart';
import 'package:breathe_with_me/utils/cacheable_bloc/bloc_cache_storage.dart';
import 'package:isar/isar.dart';

final class IsarBlocStateStorage implements BlocCacheStorage {
  final DatabaseManager _databaseManager;

  IsarBlocStateStorage(this._databaseManager);

  BlocState? _getBlocStateEntity(String key) =>
      _databaseManager.blocStateCollection.getByKeySync(key);

  @override
  Object? read(String key) => _getBlocStateEntity(key)?.json;

  @override
  Future<void> write(String key, Object? value) async {
    final dbEntity = _getBlocStateEntity(key);

    final jsonString =
        jsonEncode(value == null ? {} : value as Map<String, dynamic>);

    if (dbEntity != null) {
      dbEntity.json = jsonString;
      await _databaseManager.db.writeTxn(
        () async {
          await _databaseManager.blocStateCollection.put(dbEntity);
        },
      );
      return;
    }

    final entity = BlocState(
      key: key,
      json: jsonString,
    );

    await _databaseManager.db.writeTxn(
      () async {
        await _databaseManager.blocStateCollection.put(entity);
      },
    );
  }

  @override
  Stream<String?> stream(String key) => _databaseManager.blocStateCollection
          .where()
          .keyEqualTo(key)
          .watch(fireImmediately: true)
          .map(
        (event) {
          final entity = event.firstOrNull;
          return entity?.json;
        },
      ).distinct();

  @override
  Future<void> delete(String key) async {
    final entity = _getBlocStateEntity(key);

    if (entity != null) {
      await _databaseManager.db.writeTxn(
        () async {
          await _databaseManager.blocStateCollection.deleteByKey(entity.key);
        },
      );
    }
  }
}
