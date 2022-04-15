import 'package:cloud_firestore/cloud_firestore.dart';

class News {
  String id;
  String title;
  String image;
  String tag1;
  String tag2;
  String url;

  News({
    required this.id,
    required this.title,
    required this.image,
    required this.tag1,
    required this.tag2,
    required this.url,
  });

  factory News.fromSnapshot(DocumentSnapshot snapshot) {
    return News(
      id: snapshot.id,
      title: snapshot.get('title'),
      image: snapshot.get('image'),
      tag1: snapshot.get('tag1'),
      tag2: snapshot.get('tag2'),
      url: snapshot.get('url'),
    );
  }
}
