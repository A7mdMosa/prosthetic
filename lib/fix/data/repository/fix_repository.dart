import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FixRepository {
  final _firebaseFirestore = FirebaseFirestore.instance;
  final _firebaseAuth = FirebaseAuth.instance;

  Future<QuerySnapshot> getDocs() async {
    QuerySnapshot querySnapshot =
        await _firebaseFirestore.collection('fix').get();
    return querySnapshot;
  }

  Future<void> sendFixRequest() async {
    await _firebaseFirestore
        .collection('fix')
        .doc(_firebaseAuth.currentUser!.uid)
        .set({
      'userName': _firebaseAuth.currentUser!.email,
      'dateTime': DateTime.now().toIso8601String(),
    });
  }
}
