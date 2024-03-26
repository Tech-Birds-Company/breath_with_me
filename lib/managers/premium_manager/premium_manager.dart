final class PremiumManager {
  Stream<bool> get isPremiumUserStream =>
      Stream.value(false).asBroadcastStream();

  bool get isUserPremium => false;

  String? get premiumEndDate => null;
}
