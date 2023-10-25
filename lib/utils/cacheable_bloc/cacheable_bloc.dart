// ignore_for_file: avoid_setters_without_getters

import 'dart:convert';

import 'package:breathe_with_me/utils/cacheable_bloc/bloc_cache_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class StorageNotFound implements Exception {
  const StorageNotFound();
}

abstract base class CacheableBloc<State> extends BlocBase<State> {
  CacheableBloc(super.state);

  static BlocCacheStorage? _sharedStorage;

  String get key => '';

  static set storage(BlocCacheStorage storage) => _sharedStorage ??= storage;

  BlocCacheStorage get _storage {
    if (_sharedStorage == null) {
      throw const StorageNotFound();
    }
    return _sharedStorage!;
  }

  Future<void> cache() async {
    return _storage.write(runtimeType.toString(), toJson(state));
  }

  Future<void> loadCache() async {
    final json = _storage.read('$runtimeType$key');
    if (json == null) {
      return;
    }
    final jsonMap = jsonDecode(json as String) as Map<String, dynamic>;
    emit(fromJson(jsonMap));
  }

  Map<String, dynamic> toJson(State state);
  State fromJson(Map<String, dynamic> json);
}
