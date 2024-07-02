import 'package:breathe_with_me/managers/user_manager/user_manager.dart';
import 'package:breathe_with_me/repositories/firebase_premium_repository.dart';

final class PremiumManager {
  final UserManager _userManager;
  final FirebasePremiumRepository _firebasePremiumRepository;

  const PremiumManager(
    this._userManager,
    this._firebasePremiumRepository,
  );

  Stream<bool> get isPremiumUserStream {
    final uid = _userManager.currentUser?.uid;
    if (uid == null) {
      return Stream.value(false);
    }
    return _firebasePremiumRepository.isPremiumEnabledStream(uid);
  }

  Future<bool> get isUserPremium async {
    final uid = _userManager.currentUser?.uid;
    if (uid == null) {
      return false;
    }
    return _firebasePremiumRepository.isPremiumEnabled(uid);
  }
}
