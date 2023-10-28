import 'dart:convert';

import 'package:breathe_with_me/database/entities/bloc_state_entity.dart';
import 'package:breathe_with_me/objectbox.g.dart';
import 'package:breathe_with_me/utils/cacheable_bloc/bloc_cache_storage.dart';

final class ObjectBoxBlocStateStorage implements BlocCacheStorage {
  final Box<BlocStateEntity> _box;

  ObjectBoxBlocStateStorage(this._box);

  BlocStateEntity? _getBlocState(String key) {
    final entity =
        _box.query(BlocStateEntity_.key.equals(key)).build().findFirst();

    return entity;
  }

  @override
  Object? read(String key) {
    final entity = _getBlocState(key);

    return entity?.json;
  }

  @override
  Future<void> write(String key, Object value) async {
    final dbEntity = _getBlocState(key);
    final jsonString = jsonEncode(value as Map<String, dynamic>);

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
}
