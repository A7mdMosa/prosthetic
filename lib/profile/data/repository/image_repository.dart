import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageRepository {
  final firebaseStorage = FirebaseStorage.instance;
  final firebaseAuth = FirebaseAuth.instance;

  Future<void> uploadImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    File file = File(image!.path);
    await firebaseStorage.ref(firebaseAuth.currentUser!.uid).putFile(file);
  }

  Future<String> getImageUrl() async {
    try {
      final url = await firebaseStorage
          .ref(FirebaseAuth.instance.currentUser!.uid)
          .getDownloadURL();
      print(url);
      return url;
    } catch (e) {
      return 'https://firebasestorage.googleapis.com/v0/b/prosthetic-8656c.appspot.com/o/profile.png?alt=media&token=6e8151d1-a14e-42ee-b081-67299539d89a';
    }
  }

  Future<void> deleteImage() async {
    await firebaseStorage.ref(firebaseAuth.currentUser!.uid).delete();
  }
}
