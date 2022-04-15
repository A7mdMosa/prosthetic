import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String id;
  String title;
  String image;
  double price;
  String description1;
  String description2;
  String description3;
  String description4;
  String description5;

  Product({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.description1,
    required this.description2,
    required this.description3,
    required this.description4,
    required this.description5,
  });

  factory Product.fromSnapshot(DocumentSnapshot snapshot) {
    return Product(
      id: snapshot.id,
      title: snapshot.get('title'),
      image: snapshot.get('image'),
      price: snapshot.get('price'),
      description1: snapshot.get('description1'),
      description2: snapshot.get('description2'),
      description3: snapshot.get('description3'),
      description4: snapshot.get('description4'),
      description5: snapshot.get('description5'),
    );
  }
}
