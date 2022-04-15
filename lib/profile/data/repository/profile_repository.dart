import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../login/shared_preferences/login_shared_preferences.dart';
import '../models/user_model.dart';

class ProfileRepository {
  final firebaseFirestore = FirebaseFirestore.instance;
  final firebaseAuth = FirebaseAuth.instance;

  Future<void> logout() async {
    await firebaseAuth.signOut();
    await LoginSharedPreferences.clear();
  }

  Future<void> setUserData({required UserModel user}) async {
    await firebaseFirestore.collection('users').doc(user.id).set({
      'firstName': user.firstName,
      'lastName': user.lastName,
      'email': user.email,
      'age': user.age,
      'job': user.job,
      'image': user.image,
      'location': user.location,
      'prostheticLimb': user.prostheticLimb,
    });
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData() async {
    final snapshot = await firebaseFirestore
        .collection('users')
        .doc(firebaseAuth.currentUser!.uid)
        .get();

    return snapshot;
  }

  Future<void> updateUserData(UserModel newUserModel) async {
    await firebaseFirestore.collection('users').doc(newUserModel.id).update({
      'firstName': newUserModel.firstName,
      'lastName': newUserModel.lastName,
      'email': newUserModel.email,
      'age': newUserModel.age,
      'job': newUserModel.job,
      'image': newUserModel.image,
      'location': newUserModel.location,
      'prostheticLimb': newUserModel.prostheticLimb
    });
  }
}
