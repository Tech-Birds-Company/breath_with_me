import 'package:breathe_with_me/repositories/models/streaks_progress.dart';
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
    progress = progress.copyWith(
      minutesCount: progress.minutesCount + minutesCount,
      practicesCount: progress.practicesCount + 1,
    );

    // If lives have expired, reset it
    if (progress.livesExpireTimestamp.isBefore(DateTime.now())) {
      progress = progress.copyWith(
        livesCount: monthLivesCount,
        livesExpireTimestamp: _nextMonthTimestamp(),
      );
    }

    // If don't have streak today, add it to timeline
    if (!_containsTimestampWithSpecificDate(progress.timeline, timestamp)) {
      progress = progress.copyWith(timeline: [...progress.timeline, timestamp]);
    }

    await _streaksProgressDoc(userID).set(_jsonFromProgress(progress));
    return progress;
  }

  Future<StreaksProgress> restoreStreak(
      String userID, DateTime timestamp, int monthLivesCount) async {
    var progress = await _getStreaksProgress(userID, monthLivesCount);

    // Remove live for restore
    progress = progress.copyWith(
      livesCount: progress.livesCount - 1,
    );

    // If don't have restored streak, add it to timeline
    if (!_containsTimestampWithSpecificDate(progress.timeline, timestamp)) {
      progress = progress.copyWith(timeline: [...progress.timeline, timestamp]);
    }

    await _streaksProgressDoc(userID).set(_jsonFromProgress(progress));
    return progress;
  }

  Future<StreaksProgress> _getStreaksProgress(
    String userID,
    int monthLivesCount,
  ) async {
    final doc = await _streaksProgressDoc(userID).get();
    final json = doc.data();

    if (json != null) {
      return _progressFromJson(json);
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

  DateTime _nextMonthTimestamp() {
    final now = DateTime.now();
    if (now.month == 12) {
      return DateTime(now.year + 1);
    } else {
      return DateTime(now.year, now.month + 1);
    }
  }

  StreaksProgress _progressFromJson(Map<String, dynamic> json) {
    json['livesExpireTimestamp'] =
        _stringFromTimestamp(json['livesExpireTimestamp'] as Timestamp);
    json['timeline'] = (json['timeline'] as List<dynamic>)
        .map((e) => _stringFromTimestamp(e as Timestamp))
        .toList();
    return StreaksProgress.fromJson(json);
  }

  Map<String, dynamic> _jsonFromProgress(StreaksProgress progress) {
    final json = progress.toJson();
    json['livesExpireTimestamp'] =
        _timestampFromDateTime(progress.livesExpireTimestamp);
    json['timeline'] = progress.timeline.map(_timestampFromDateTime).toList();
    return json;
  }

  String _stringFromTimestamp(Timestamp timestamp) {
    final dateTime =
        DateTime.fromMicrosecondsSinceEpoch(timestamp.microsecondsSinceEpoch);
    return dateTime.toIso8601String();
  }

  Timestamp _timestampFromDateTime(DateTime dateTime) {
    return Timestamp.fromMicrosecondsSinceEpoch(
      dateTime.microsecondsSinceEpoch,
    );
  }
}
