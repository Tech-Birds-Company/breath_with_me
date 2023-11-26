abstract interface class RemoteConfigRepository<T> {
  Future<T> getRemoteConfig();

  Stream<T> get remoteConfigStream;

  Future<void> saveRemoteConfig(T config);
}
