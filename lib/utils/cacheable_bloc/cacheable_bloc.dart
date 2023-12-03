// ignore_for_file: avoid_setters_without_getters

import 'dart:convert';

import 'package:breathe_with_me/utils/cacheable_bloc/bloc_cache_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class StorageNotFound implements Exception {
  const StorageNotFound();
}

abstract base class CacheableBloc<State> extends BlocBase<State> {
  CacheableBloc(super.state) {
    loadCache();
  }

  static BlocCacheStorage? _sharedStorage;

  String get key => '';

  String get _entityName => '$runtimeType$key';

  static set storage(BlocCacheStorage storage) => _sharedStorage ??= storage;

  Stream<State?> get cachedBlocStateStream {
    return _storage.stream(_entityName).map((object) {
      if (object == null) {
        return null;
      }
      final jsonMap = jsonDecode(object as String) as Map<String, dynamic>;
      return fromJson(jsonMap);
    });
  }

  BlocCacheStorage get _storage {
    if (_sharedStorage == null) {
      throw const StorageNotFound();
    }

    return _sharedStorage!;
  }

  Future<void> cache() => _storage.write(
        _entityName,
        toJson(state),
      );

  Future<void> loadCache() async {
    final json = _storage.read('$runtimeType$key');
    if (json == null) {
      return;
    }
    final jsonMap = jsonDecode(json as String) as Map<String, dynamic>;
    emit(fromJson(jsonMap));
  }

  Future<void> deleteCache() => _storage.delete(_entityName);

  Map<String, dynamic> toJson(State state);

  State fromJson(Map<String, dynamic> json);
}
