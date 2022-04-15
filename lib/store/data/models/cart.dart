import 'package:cloud_firestore/cloud_firestore.dart';

class Cart {
  String id;
  String title;
  String image;
  double price;
  int quantity;
  double totalPrice;

  Cart({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.quantity,
    required this.totalPrice,
  });

  factory Cart.fromSnapshot(DocumentSnapshot snapshot) {
    return Cart(
      id: snapshot.id,
      title: snapshot.get('title'),
      image: snapshot.get('image'),
      price: snapshot.get('price'),
      quantity: snapshot.get('quantity'),
      totalPrice: snapshot.get('totalPrice'),
    );
  }
}
