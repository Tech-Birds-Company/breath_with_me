import 'package:breathe_with_me/features/streak/models/streaks_progress.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final class StreaksProgressRepository {
  static const _streaksCollection = 'streaks';

  const StreaksProgressRepository();

  Future<StreaksProgress> addPractice(
    String userID,
    DateTime timestamp,
    int minutesCount,
    int monthLivesCount,
  ) async {
    var progress = await _getStreaksProgress(userID, monthLivesCount);

    // Add practice minutes to progress
    progress = progress.copyWith(minutesCount: progress.minutesCount + minutesCount);

    // If lives have expired, reset it
    if (progress.livesExpireTimestamp.isBefore(DateTime.now())) {
      progress = progress.copyWith(
        livesCount: monthLivesCount,
        livesExpireTimestamp: _nextMonthTimestamp(),
      );
    }

    // If don't have streak today, add it to timeline
    if (!_containsTimestampWithSpecificDate(progress.timeline, timestamp)) {
      progress.timeline.add(timestamp);
    }

    await _streaksProgressDoc(userID).set(progress.toJson());
    return progress;
  }

  // Future<StreaksProgress> restoreStreak() async {}

  Future<StreaksProgress> _getStreaksProgress(
    String userID,
    int monthLivesCount,
  ) async {
    final doc = await _streaksProgressDoc(userID).get();
    final json = doc.data();

    if (json != null) {
      return StreaksProgress.fromJson(json);
    } else {
      return StreaksProgress(
        livesCount: monthLivesCount,
        livesExpireTimestamp: _nextMonthTimestamp(),
        minutesCount: 0,
        practicesCount: 0,
        timeline: [],
      );
    }
  }

  DocumentReference<Map<String, dynamic>> _streaksProgressDoc(String userID) {
    return FirebaseFirestore.instance.collection(StreaksProgressRepository._streaksCollection).doc(userID);
  }

  bool _containsTimestampWithSpecificDate(
    List<DateTime> timeline,
    DateTime timestamp,
  ) {
    return timeline.any(
      (current) => current.day == timestamp.day && current.month == timestamp.month && current.year == timestamp.year,
    );
  }

  DateTime _nextMonthTimestamp() {
    final now = DateTime.now();
    if (now.month == 12) {
      return DateTime(now.year + 1);
    } else {
      return DateTime(now.year, now.month + 1);
    }
  }
}
