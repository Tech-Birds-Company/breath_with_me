import 'dart:convert';

import 'package:breathe_with_me/database/database.dart';
import 'package:breathe_with_me/database/schemas/bloc_state_schema.dart';
import 'package:breathe_with_me/database/schemas/download_track_task_schema.dart';
import 'package:breathe_with_me/database/schemas/liked_track_schema.dart';
import 'package:breathe_with_me/database/schemas/secure_image_url_schema.dart';
import 'package:breathe_with_me/features/tracks/models/track.dart';
import 'package:breathe_with_me/features/tracks/models/tracks_list_state.dart';
import 'package:breathe_with_me/managers/database_manager/database_cached_keys.dart';
import 'package:isar/isar.dart';

final class DatabaseManager {
  final BWMDatabase _database;

  DatabaseManager(this._database);

  late final db = _database.instance;
  late final blocStateCollection = db.blocStates;
  late final likedTracksCollection = db.likedTracks;
  late final downloadTrackTasksCollection = db.downloadTrackTasks;

  Future<DownloadTrackTask?> getDownloadTask(String taskId) =>
      downloadTrackTasksCollection.getByTaskId(taskId);

  Future<DownloadTrackTask> createDownloadTrackTask({
    required String taskId,
    required String filename,
    required String url,
    required int totalBytes,
  }) async {
    final task = DownloadTrackTask(
      taskId: taskId,
      filename: filename,
      url: url,
      totalBytes: totalBytes,
    );
    await db.writeTxn(
      () => downloadTrackTasksCollection.putByTaskId(task),
    );
    return task;
  }

  Future<void> deleteDownloadTask(String taskId) =>
      downloadTrackTasksCollection.deleteByTaskId(taskId);

  Future<void> saveSecureUrl(String baseUrl, String secureUrl) async {
    final secureUrlModel =
        SecureImageUrl(baseUrl: baseUrl, secureUrl: secureUrl);
    await db.writeTxn(
      () async => db.secureImageUrls.putByBaseUrl(secureUrlModel),
    );
  }

  Future<SecureImageUrl?> getSecureUrl(String baseUrl) =>
      db.secureImageUrls.getByBaseUrl(baseUrl);

  Stream<double> taskProgressStream({required String taskId}) =>
      downloadTrackTasksCollection
          .where()
          .taskIdEqualTo(taskId)
          .watch(
            fireImmediately: true,
          )
          .map(
        (event) {
          final task = event.firstOrNull;
          if (task == null) {
            return 0.0;
          }
          final downloadedBytes = task.downloadedBytes;
          final totalBytes = task.totalBytes ?? 0;
          if (totalBytes > 0) {
            return downloadedBytes / totalBytes;
          }
          return 0.0;
        },
      ).distinct();

  Stream<Set<String>> get likedTracksStream => likedTracksCollection
      .where()
      .build()
      .watch(fireImmediately: true)
      .map(
        (items) => items
            .map(
              (it) => it.trackId,
            )
            .toSet(),
      )
      .distinct();

  Stream<List<Track>> get cachedTracksStream => blocStateCollection
          .where()
          .keyEqualTo(DatabaseCachedKeys.cachedTracksKey)
          .watch(fireImmediately: true)
          .map(
        (event) {
          final entity = event.firstOrNull;
          if (entity != null) {
            final json = jsonDecode(entity.json) as Map<String, dynamic>;
            final state = TracksListState.fromJson(json);
            final tracks = state.maybeWhen(
              data: (tracks, _) => tracks,
              orElse: () => <Track>[],
            );
            return tracks;
          }
          return <Track>[];
        },
      ).distinct();

  Future<void> clearDb() => db.writeTxn(
        () async {
          await blocStateCollection.clear();
          await likedTracksCollection.clear();
          await db.secureImageUrls.clear();
        },
      );

  void dispose() => db.close();
}
