import 'package:breathe_with_me/features/streak/models/user_progress.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final class UserProgressRepository {
  static const _userProgressCollection = 'users';

  const UserProgressRepository();

  Future<UserProgress?> getUserProgress(String uid) async {
    final response = await FirebaseFirestore.instance
        .collection(UserProgressRepository._userProgressCollection)
        .where('uid', isEqualTo: uid)
        .limit(1)
        .get();
    return UserProgress.fromJson(response.docs.first.data());
  }

  Future<void> saveUserProgress(UserProgress userProgress, String uid) async {}
}
