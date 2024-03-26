import 'package:breathe_with_me/features/tracks/models/tutor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: one_member_abstracts
abstract interface class TutorRepository {
  Future<Tutor> getTutorFromReference(
    DocumentReference<Map<String, dynamic>> ref,
  );
}
