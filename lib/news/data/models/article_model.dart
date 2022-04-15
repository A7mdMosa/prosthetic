import 'package:cloud_firestore/cloud_firestore.dart';

class Article {
  String id;
  String title;
  String description;
  String article;
  String image;
  String tag1;
  String tag2;

  Article({
    required this.id,
    required this.title,
    required this.description,
    required this.article,
    required this.image,
    required this.tag1,
    required this.tag2,
  });

  factory Article.fromSnapshot(DocumentSnapshot snapshot) {
    return Article(
      id: snapshot.id,
      title: snapshot.get('title'),
      description: snapshot.get('description'),
      article: snapshot.get('article'),
      image: snapshot.get('image'),
      tag1: snapshot.get('tag1'),
      tag2: snapshot.get('tag2'),
    );
  }
}
