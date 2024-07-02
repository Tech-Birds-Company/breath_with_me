import 'package:breathe_with_me/repositories/models/premium_users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final class FirebasePremiumRepository {
  static const _premiumUsersCollection = 'premium_users';

  const FirebasePremiumRepository();

  bool _isPremiumEnabled(PremiumUsers model) {
    final enabled = model.enabled;
    if (!enabled) {
      return false;
    }
    final expire = model.expire;
    if (expire != null) {
      return expire.isAfter(DateTime.now());
    }
    return enabled;
  }

  Stream<bool> isPremiumEnabledStream(String uid) {
    return FirebaseFirestore.instance
        .collection(_premiumUsersCollection)
        .doc(uid)
        .snapshots()
        .map((event) {
      if (event.exists) {
        final model = PremiumUsers.fromJson(event.data()!);
        return _isPremiumEnabled(model);
      }
      return false;
    });
  }

  Future<bool> isPremiumEnabled(String uid) async {
    final result = await FirebaseFirestore.instance
        .collection(_premiumUsersCollection)
        .doc(uid)
        .get();
    if (result.exists) {
      final model = PremiumUsers.fromJson(result.data()!);
      return _isPremiumEnabled(model);
    }
    return false;
  }
}
