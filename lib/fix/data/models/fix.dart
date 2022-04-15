import 'package:cloud_firestore/cloud_firestore.dart';

class Fix {
  String id;
  String userName;
  DateTime dateTime;

  Fix({
    required this.id,
    required this.userName,
    required this.dateTime,
  });

  factory Fix.fromSnapshot(DocumentSnapshot snapshot) {
    return Fix(
        id: snapshot.id,
        userName: snapshot.get('userName'),
        dateTime: DateTime.parse(snapshot.get('dateTime')));
  }
}
