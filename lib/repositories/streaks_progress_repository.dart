import 'package:breathe_with_me/repositories/models/streaks_progress.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final class StreaksProgressRepository {
  static const _streaksCollection = 'streaks';

  const StreaksProgressRepository();

  Future<StreaksProgress> _updateStreaksProgress(
    String userId,
    DateTime timestamp,
    int minutesCount,
    int monthLivesCount,
    bool isRestore,
  ) async {
    final utcTimestamp = timestamp.toUtc();
    var progress = await getStreaksProgress(userId, monthLivesCount);

    // Add practice minutes to progress or remove live for restore
    progress = progress.copyWith(
      minutesCount: progress.minutesCount + minutesCount,
      practicesCount:
          isRestore ? progress.practicesCount : progress.practicesCount + 1,
      livesCount: isRestore ? progress.livesCount - 1 : progress.livesCount,
    );

    // If lives have expired, reset it
    if (progress.livesExpireTimestamp.isBefore(DateTime.now().toUtc())) {
      progress = progress.copyWith(
        livesCount: monthLivesCount,
        livesExpireTimestamp: _nextMonthTimestamp(),
      );
    }

    // If don't have streak today, add it to timeline
    if (!_containsTimestampWithSpecificDate(progress.timeline, utcTimestamp)) {
      progress =
          progress.copyWith(timeline: [...progress.timeline, utcTimestamp]);
    }

    await _streaksProgressDoc(userId).set(_jsonFromProgress(progress));
    return progress;
  }

  Future<StreaksProgress> addPractice(
    String userId,
    DateTime timestamp,
    int minutesCount,
    int monthLivesCount,
  ) =>
      _updateStreaksProgress(
        userId,
        timestamp,
        minutesCount,
        monthLivesCount,
        false,
      );

  Future<StreaksProgress> restoreStreak(
    String userId,
    DateTime timestamp,
    int monthLivesCount,
  ) =>
      _updateStreaksProgress(
        userId,
        timestamp,
        0,
        monthLivesCount,
        true,
      );

  Future<StreaksProgress> getStreaksProgress(
    String userId,
    int monthLivesCount,
  ) async {
    final doc = await _streaksProgressDoc(userId).get();
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

  DocumentReference<Map<String, dynamic>> _streaksProgressDoc(String userId) =>
      FirebaseFirestore.instance
          .collection(StreaksProgressRepository._streaksCollection)
          .doc(userId);

  bool _containsTimestampWithSpecificDate(
    List<DateTime> timeline,
    DateTime timestamp,
  ) =>
      timeline.any(
        (current) =>
            current.day == timestamp.day &&
            current.month == timestamp.month &&
            current.year == timestamp.year,
      );

  DateTime _nextMonthTimestamp() {
    final now = DateTime.now().toUtc();
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

  String _stringFromTimestamp(Timestamp timestamp) =>
      timestamp.toDate().toIso8601String();

  Timestamp _timestampFromDateTime(DateTime dateTime) =>
      Timestamp.fromDate(dateTime);
}
