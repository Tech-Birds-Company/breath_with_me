import 'dart:convert';

import 'package:breathe_with_me/database/database.dart';
import 'package:breathe_with_me/database/entities/bloc_state_entity.dart';
import 'package:breathe_with_me/database/entities/download_track_task_entity.dart';
import 'package:breathe_with_me/database/entities/liked_tracks_entity.dart';
import 'package:breathe_with_me/database/entities/remote_config_entity.dart';
import 'package:breathe_with_me/database/entities/secure_image_url_provider_entity.dart';
import 'package:breathe_with_me/features/tracks/models/track.dart';
import 'package:breathe_with_me/features/tracks/models/tracks_list_state.dart';
import 'package:breathe_with_me/managers/database_manager/database_cached_keys.dart';
import 'package:breathe_with_me/objectbox.g.dart';

final class DatabaseManager {
  final BWMDatabase _database;

  DatabaseManager(this._database);

  late final _store = _database.store;
  late final downloadTaskBox = _store.box<DownloadTrackTaskEntity>();
  late final remoteConfigBox = _store.box<RemoteConfigEntity>();
  late final blocStateBox = _store.box<BlocStateEntity>();
  late final likedTracksBox = _store.box<LikedTracksEntity>();
  late final secureImageUrlBox = _store.box<SecureImageUrlEntity>();

  Future<DownloadTrackTaskEntity?> getDownloadTask(String taskId) =>
      downloadTaskBox
          .query(DownloadTrackTaskEntity_.taskId.equals(taskId))
          .build()
          .findFirstAsync();

  Future<DownloadTrackTaskEntity> createDownloadTrackTask({
    required String uid,
    required String id,
    required String filename,
    required String url,
    required int totalBytes,
  }) async {
    final dbEntity = await getDownloadTask(id);

    if (dbEntity != null) {
      await downloadTaskBox.removeAsync(dbEntity.id);
    }

    final entity = DownloadTrackTaskEntity(
      uid: uid,
      taskId: id,
      url: url,
      filename: filename,
      totalBytes: totalBytes,
    );

    return downloadTaskBox.putAndGetAsync(entity);
  }

  Future<void> deleteDownloadTask(String taskId) => downloadTaskBox
      .query(DownloadTrackTaskEntity_.taskId.equals(taskId))
      .build()
      .removeAsync();

  Future<RemoteConfigEntity?> getRemoteConfig() =>
      remoteConfigBox.query().build().findFirstAsync();

  Future<void> saveRemoteConfig(Map<String, Object?> json) async {
    final entities = await remoteConfigBox.getAllAsync();
    final jsonString = jsonEncode(json);
    if (entities.isNotEmpty) {
      final updatedEntity = entities.first..json = jsonString;
      await remoteConfigBox.putAsync(updatedEntity);
    } else {
      final entity = RemoteConfigEntity(json: jsonString);
      await remoteConfigBox.putAsync(entity);
    }
  }

  Future<void> saveSecureUrl(String baseUrl, String secureUrl) async {
    final entity = await getSecureUrl(baseUrl);

    secureImageUrlBox.putQueued(
      entity ??
          SecureImageUrlEntity(
            baseUrl: baseUrl,
            secureUrl: secureUrl,
          )
        ..baseUrl = baseUrl
        ..secureUrl = secureUrl,
      mode: entity == null ? PutMode.insert : PutMode.update,
    );
  }

  Future<SecureImageUrlEntity?> getSecureUrl(String baseUrl) =>
      secureImageUrlBox
          .query(
            SecureImageUrlEntity_.baseUrl.equals(baseUrl),
          )
          .build()
          .findFirstAsync();

  Stream<double> taskProgressStream(String taskId) => downloadTaskBox
          .query(DownloadTrackTaskEntity_.taskId.equals(taskId))
          .watch(triggerImmediately: true)
          .map(
        (event) {
          final task = event.findFirst();
          if (task != null) {
            final downloadedBytes = task.downloadedBytes;
            final totalBytes = task.totalBytes ?? 0;
            if (totalBytes > 0) {
              return downloadedBytes / totalBytes;
            }
          }
          return 0.0;
        },
      ).distinct();

  Stream<Set<String>> get likedTracksStream =>
      likedTracksBox.query().watch(triggerImmediately: true).map(
        (query) {
          final entity = query.findFirst();
          return entity?.likes.toSet() ?? <String>{};
        },
      ).distinct();

  Stream<List<Track>> get cachedTracksStream => blocStateBox
          .query(
            BlocStateEntity_.key.equals(DatabaseCachedKeys.cachedTracksKey),
          )
          .watch(triggerImmediately: true)
          .map(
        (event) {
          final entity = event.findFirst();
          if (entity != null) {
            final json = jsonDecode(entity.json) as Map<String, dynamic>;
            final state = TracksListState.fromJson(json);
            final tracks = state.maybeWhen(
              data: (tracks) => tracks,
              orElse: () => <Track>[],
            );
            return tracks;
          }
          return <Track>[];
        },
      ).distinct();

  void clearDb() {
    blocStateBox.removeAll();
    likedTracksBox.removeAll();
    secureImageUrlBox.removeAll();
  }

  void dispose() => _store.close();
}
