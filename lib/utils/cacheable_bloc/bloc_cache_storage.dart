abstract interface class BlocCacheStorage {
  Object? read(String key);

  Future<void> write(String key, Object? value);

  Stream<String?> stream(String key);

  Future<void> delete(String key);
}
