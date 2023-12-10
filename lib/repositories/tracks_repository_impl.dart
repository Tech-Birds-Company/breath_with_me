import 'package:breathe_with_me/constants.dart';
import 'package:breathe_with_me/database/entities/download_track_task_entity.dart';
import 'package:breathe_with_me/database/entities/liked_tracks_entity.dart';
import 'package:breathe_with_me/features/practices/models/track.dart';
import 'package:breathe_with_me/managers/database_manager/database_manager.dart';
import 'package:breathe_with_me/managers/user_manager/user_manager.dart';
import 'package:breathe_with_me/repositories/firebase_tutors_repository.dart';
import 'package:breathe_with_me/repositories/tracks_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:objectbox/objectbox.dart';

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
  static const _likesField = 'likes';

  String? get currentUserUid => _userManager.currentUser?.uid;

  Future<Track> _getTrackFromDocument(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) async {
    final id = document.id;
    final data = document.data();

    final tutorRef =
        data!.remove('tutor') as DocumentReference<Map<String, dynamic>>;
    final tutor = await _tutorRepository.getTutorFromReference(tutorRef);
    final trackJson = {
      'id': id,
      ...data,
      'tutor': tutor.toJson(),
    };

    return Track.fromJson(trackJson);
  }

  @override
  Future<Track> getTrack(String trackId) async {
    final response = FirebaseFirestore.instance
        .doc('${BWMConstants.tracksCollection}/$trackId');
    final document = await response.get();

    final track = await _getTrackFromDocument(document);
    return track;
  }

  @override
  Future<List<Track>> getTracks() async {
    final res = await FirebaseFirestore.instance
        .collection(BWMConstants.tracksCollection)
        .get();
    final tracks = <Track>[];

    for (final doc in res.docs) {
      final track = await _getTrackFromDocument(doc);
      tracks.add(track);
    }

    return tracks;
  }

  @override
  Future<DownloadTrackTaskEntity?> getTrackDownloadTask(String trackId) async {
    final entity = await _databaseManager.getDownloadTask(trackId);

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
  Stream<bool> getTrackIsDownloadedStream(String trackId) {
    return _databaseManager
        .taskProgressStream(trackId)
        .map((progress) => progress == 1.0);
  }

  @override
  Future<void> deleteTrackDownloadTask(String taskId) =>
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
  Future<void> cacheLikedTracks(List<String> likedTracks) async {
    final entities = await _databaseManager.likedTracksBox.getAllAsync();
    final entity = entities.firstOrNull;
    _databaseManager.likedTracksBox.putQueued(
      entity ??
          LikedTracksEntity(
            likes: likedTracks,
          )
        ..likes = likedTracks,
      mode: entity == null ? PutMode.insert : PutMode.update,
    );
  }

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
        await docReference.update({
          _likesField: FieldValue.arrayRemove([trackId]),
        });
      } else {
        await docReference.update({
          _likesField: FieldValue.arrayUnion([trackId]),
        });
      }
    } else {
      await docReference.set({
        _likesField: [trackId],
      });
    }
  }
}
