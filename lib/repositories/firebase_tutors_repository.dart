import 'package:breathe_with_me/features/tracks/models/tutor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final class FirebaseTutorsRepository {
  const FirebaseTutorsRepository();

  Future<Tutor> getTutorFromReference(
    DocumentReference<Map<String, dynamic>> ref,
  ) async {
    final path = ref.path;
    final snapshot = await FirebaseFirestore.instance.doc(path).get();
    final tutorId = snapshot.id;

    final data = snapshot.data();
    final tutorJson = {
      'id': tutorId,
      ...data!,
    };

    return Tutor.fromJson(tutorJson);
  }
}
