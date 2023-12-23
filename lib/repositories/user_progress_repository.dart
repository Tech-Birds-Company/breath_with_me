import 'package:breathe_with_me/features/streak/models/streaks_progress.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final class StreaksProgressRepository {
  static const _streaksCollection = 'streaks';

  const StreaksProgressRepository();

  Future<StreaksProgress> saveStreak(
    String userID,
    DateTime timestamp,
    int minutesCount,
  ) async {
    final progress = await _getStreaksProgress(userID);

    if (!_containsTimestampWithSpecificDate(progress.timeline, timestamp)) {
      progress.timeline.add(timestamp);
    }

    await _streaksProgressDoc(userID).set(progress.toJson());
    return progress;
  }

  Future<StreaksProgress> _getStreaksProgress(String userID) async {
    final doc = await _streaksProgressDoc(userID).get();
    final json = doc.data();

    if (json != null) {
      return StreaksProgress.fromJson(json);
    } else {
      return StreaksProgress(
        livesCount: 0,
        livesExpireTimestamp: DateTime.now(),
        minutesCount: 0,
        practicesCount: 0,
        timeline: [],
      );
    }
  }

  DocumentReference<Map<String, dynamic>> _streaksProgressDoc(String userID) {
    return FirebaseFirestore.instance
        .collection(StreaksProgressRepository._streaksCollection)
        .doc(userID);
  }

  bool _containsTimestampWithSpecificDate(
    List<DateTime> timeline,
    DateTime timestamp,
  ) {
    return timeline.any(
      (current) =>
          current.day == timestamp.day &&
          current.month == timestamp.month &&
          current.year == timestamp.year,
    );
  }
}
