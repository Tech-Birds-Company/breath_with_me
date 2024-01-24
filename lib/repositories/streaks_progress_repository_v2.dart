import 'package:breathe_with_me/repositories/models/streak_progress_v2.dart';
import 'package:breathe_with_me/repositories/remote_config_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StreakProgressRepositoryV2 {
  static const _collection = 'streaks';

  final FirebaseFirestore _firestore;
  final RemoteConfigRepository _remoteConfig;

  StreakProgressRepositoryV2(
    this._firestore,
    this._remoteConfig,
  );

  late final _streakCollection = _firestore.collection(_collection);
  late final _defaultTotalLives = _remoteConfig.streaks.monthLivesCount;

  Stream<StreakProgressV2> getStreakProgressStream(String userId) =>
      _streakCollection.doc(userId).snapshots().distinct().map(
        (snapshot) {
          if (snapshot.exists) {
            return StreakProgressV2.fromJson(snapshot.data()!);
          } else {
            return StreakProgressV2(
              totalLives: _defaultTotalLives,
              utcTimeline: [],
            );
          }
        },
      );

  Future<StreakProgressV2> setUserProgressData(
    String userId,
    StreakProgressV2 streakProgressV2,
  ) async {
    await _setUserStreak(userId, streakProgressV2);
    return streakProgressV2;
  }

  Future<StreakProgressV2> getUserStreakProgress(String userId) async {
    final doc = await _streakCollection.doc(userId).get();
    if (doc.exists) {
      return StreakProgressV2.fromJson(doc.data()!);
    } else {
      final progress = StreakProgressV2(
        totalLives: _defaultTotalLives,
        utcTimeline: [],
      );
      await _setUserStreak(userId, progress);
      return progress;
    }
  }

  Future<void> _setUserStreak(
    String userId,
    StreakProgressV2 streakProgressV2,
  ) =>
      _streakCollection.doc(userId).set(
            streakProgressV2.toJson(),
          );
}
