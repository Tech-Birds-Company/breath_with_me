abstract interface class SubscriptionsManager<P extends Object?,
    E extends Object?> {
  void init();

  Future<Map<String, P>> getProducts();

  Future<Map<String, E>> getEntitlements();

  Stream<Map<String, E>> get entitlementsStream;

  Future<Map<String, E>> purchase(String productId);
}
