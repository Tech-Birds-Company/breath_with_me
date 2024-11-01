import 'package:breathe_with_me/database/schemas/download_track_task_schema.dart';
import 'package:breathe_with_me/database/schemas/liked_track_schema.dart';
import 'package:breathe_with_me/features/tracks/models/track.dart';
import 'package:breathe_with_me/features/tracks/models/track_language.dart';
import 'package:breathe_with_me/managers/database_manager/database_manager.dart';
import 'package:breathe_with_me/managers/user_manager/user_manager.dart';
import 'package:breathe_with_me/repositories/firebase_tutors_repository.dart';
import 'package:breathe_with_me/repositories/tracks_repository.dart';
import 'package:breathe_with_me/utils/logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final class TracksRepositoryImpl implements TracksRepository {
  final UserManager _userManager;
  final DatabaseManager _databaseManager;
  final FirebaseTutorsRepository _tutorRepository;

  const TracksRepositoryImpl(
    this._userManager,
    this._databaseManager,
    this._tutorRepository,
  );

  static const _likesCollection = 'tracks_v2_likes';
  static const _tracksCollection = 'tracks_v2';
  static const _premiumTracksCollection = 'premium_tracks_v2';
  static const _likesField = 'likes';

  String? get currentUserUid => _userManager.currentUser?.uid;

  Future<Track?> _getTrackFromDocument(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) async {
    final id = document.id;
    final data = document.data();

    try {
      final tutorRef =
          data!.remove('tutor') as DocumentReference<Map<String, Object?>>;
      final tutor = await _tutorRepository.getTutorFromReference(tutorRef);
      final trackJson = {
        'id': id,
        ...data,
        'tutor': tutor.toJson(),
      };
      return Track.fromJson(trackJson);
    } on Object catch (err) {
      logger.e(err);
      return null;
    }
  }

  @override
  Future<List<Track>> getTracks() async {
    final regularTracksRes =
        await FirebaseFirestore.instance.collection(_tracksCollection).get();
    final premiumTracksRes = await FirebaseFirestore.instance
        .collection(_premiumTracksCollection)
        .get();

    final tracks = <Track>[];
    for (final doc in [...regularTracksRes.docs, ...premiumTracksRes.docs]) {
      final track = await _getTrackFromDocument(doc);
      if (track != null) {
        tracks.add(track);
      }
    }

    final languageFilteredTracks = tracks
        .where(
          (track) => track.language != TrackLanguage.unknown,
        )
        .toList();

    final sortedTracksByOrder = languageFilteredTracks
      ..sort(
        (a, b) {
          if (a.listOrder == null && b.listOrder == null) return 0;
          if (a.listOrder == null) return 1;
          if (b.listOrder == null) return -1;
          return a.listOrder!.compareTo(b.listOrder!);
        },
      );

    return sortedTracksByOrder;
  }

  @override
  Future<DownloadTrackTask?> getTrackDownloadTask({
    required String taskId,
  }) async {
    final entity = await _databaseManager.getDownloadTask(taskId);

    return entity;
  }

  @override
  Future<String> getTrackDownloadUrl(Track track) async {
    final url = await FirebaseStorage.instance
        .refFromURL(track.trackFile)
        .getDownloadURL();

    return url;
  }

  @override
  Stream<bool> getTrackIsDownloadedStream({required String taskId}) =>
      _databaseManager
          .taskProgressStream(taskId: taskId)
          .map((progress) => progress == 1.0);

  @override
  Future<void> deleteTrackDownloadTask({required String taskId}) =>
      _databaseManager.deleteDownloadTask(taskId);

  @override
  Stream<Set<String>> get firebaseLikedTracksStream {
    if (currentUserUid == null) {
      return Stream.value(<String>{});
    }
    return FirebaseFirestore.instance
        .doc('$_likesCollection/$currentUserUid')
        .snapshots()
        .map(
      (documentSnapshot) {
        final data = documentSnapshot.data();
        if (data == null) {
          return <String>{};
        }
        final likes =
            (data[_likesField] as List<Object?>).cast<String>().toSet();
        return likes;
      },
    ).distinct();
  }

  @override
  Stream<Set<String>> get likedTracksStream {
    if (currentUserUid == null) {
      return Stream.value(<String>{});
    }
    return _databaseManager.likedTracksStream;
  }

  @override
  Future<void> cacheLikedTracks(List<String> likedTracks) async =>
      _databaseManager.db.writeTxn(
        () async {
          await _databaseManager.likedTracksCollection.clear();
          await _databaseManager.likedTracksCollection.putAll(
            likedTracks
                .map(
                  (trackId) => LikedTrack(trackId: trackId),
                )
                .toList(),
          );
        },
      );

  @override
  Future<void> updateLikes(String trackId) async {
    final docReference =
        FirebaseFirestore.instance.doc('$_likesCollection/$currentUserUid');
    final doc = await docReference.get();
    if (doc.exists) {
      final data = doc.data();
      if (data == null) {
        return;
      }
      final likes = (data[_likesField] as List<Object?>).cast<String>().toSet();
      if (likes.contains(trackId)) {
        await docReference.update(
          {
            _likesField: FieldValue.arrayRemove([trackId]),
          },
        );
      } else {
        await docReference.update(
          {
            _likesField: FieldValue.arrayUnion([trackId]),
          },
        );
      }
    } else {
      await docReference.set(
        {
          _likesField: [trackId],
        },
      );
    }
  }

  @override
  Stream<List<Track>> get cachedTracksStream =>
      _databaseManager.cachedTracksStream;
}
