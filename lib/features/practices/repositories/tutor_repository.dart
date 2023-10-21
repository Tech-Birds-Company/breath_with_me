import 'package:breathe_with_me/features/practices/models/tutor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final class TutorRepository {
  const TutorRepository();

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
