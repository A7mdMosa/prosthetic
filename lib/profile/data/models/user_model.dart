import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String firstName;
  String lastName;
  String email;
  String job;
  String image;
  String prostheticLimb;
  String location;
  int age;

  UserModel(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.prostheticLimb,
      required this.email,
      required this.age,
      required this.image,
      required this.job,
      required this.location});

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    return UserModel(
      id: snapshot.id,
      firstName: snapshot.get('firstName'),
      lastName: snapshot.get('lastName'),
      email: snapshot.get('email'),
      job: snapshot.get('job'),
      image: snapshot.get('image'),
      location: snapshot.get('location'),
      age: snapshot.get('age'),
      prostheticLimb: snapshot.get('prostheticLimb'),
    );
  }
}
