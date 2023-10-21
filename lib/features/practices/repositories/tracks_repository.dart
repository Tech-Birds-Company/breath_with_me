import 'package:breathe_with_me/constants.dart';
import 'package:breathe_with_me/features/practices/models/track.dart';
import 'package:breathe_with_me/features/practices/repositories/tutor_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final class TracksRepository {
  final TutorRepository _tutorRepository;
  const TracksRepository(this._tutorRepository);

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

  Future<Track> getTrack(String trackId) async {
    final response = FirebaseFirestore.instance
        .doc('${BWMConstants.tracksCollection}/$trackId');
    final document = await response.get();

    final track = await _getTrackFromDocument(document);
    return track;
  }

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

  Future<String> getTrackDownloadUrl(Track track) async {
    final url = await FirebaseStorage.instance
        .refFromURL(track.trackFile)
        .getDownloadURL();

    return url;
  }
}
