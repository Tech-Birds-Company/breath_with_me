import 'dart:convert';

import 'package:breathe_with_me/database/entities/bloc_state_entity.dart';
import 'package:breathe_with_me/objectbox.g.dart';
import 'package:breathe_with_me/utils/cacheable_bloc/bloc_cache_storage.dart';

final class ObjectBoxBlocStateStorage implements BlocCacheStorage {
  final Box<BlocStateEntity> _box;

  ObjectBoxBlocStateStorage(this._box);

  BlocStateEntity? _getBlocStateEntity(String key) {
    final entity =
        _box.query(BlocStateEntity_.key.equals(key)).build().findFirst();

    return entity;
  }

  @override
  Object? read(String key) {
    final entity = _getBlocStateEntity(key);

    return entity?.json;
  }

  @override
  Future<void> write(String key, Object? value) async {
    final dbEntity = _getBlocStateEntity(key);

    final jsonString =
        jsonEncode(value == null ? {} : value as Map<String, dynamic>);

    if (dbEntity != null) {
      dbEntity.json = jsonString;
      await _box.putAsync(dbEntity);
      return;
    }

    final entity = BlocStateEntity(
      key: key,
      json: jsonString,
    );

    await _box.putAsync(entity);
  }

  @override
  Stream<Object?> stream(String key) {
    return _box
        .query(BlocStateEntity_.key.equals(key))
        .watch(triggerImmediately: true)
        .map(
          (entity) => entity.findFirst()?.json,
        )
        .distinct();
  }

  @override
  Future<void> delete(String key) async {
    final entity = _getBlocStateEntity(key);

    if (entity != null) {
      await _box.removeAsync(entity.id);
    }
  }
}
