abstract interface class BlocCacheStorage {
  Object? read(String key);
  Future<void> write(String key, Object value);
}
