import 'package:cloud_firestore/cloud_firestore.dart';
import 'cart.dart';

class Order {
  final String id;
  final String userName;
  final double total;
  final DateTime dateTime;
  final List<Cart> cartList;
  final String city;
  final String country;
  final String addressLine1;
  final String addressLine2;
  final String phoneNumber;

  Order(
      {required this.id,
      required this.total,
      required this.userName,
      required this.cartList,
      required this.dateTime,
      required this.city,
      required this.country,
      required this.addressLine1,
      required this.addressLine2,
      required this.phoneNumber});

  factory Order.fromSnapshot(DocumentSnapshot snapshot) {
    return Order(
      id: snapshot.id,
      total: snapshot.get('total'),
      userName: snapshot.get('userName'),
      city: snapshot.get('city'),
      country: snapshot.get('country'),
      addressLine1: snapshot.get('addressLine1'),
      addressLine2: snapshot.get('addressLine2'),
      phoneNumber: snapshot.get('phoneNumber'),
      dateTime: DateTime.parse(snapshot.get('dateTime')),
      cartList: (snapshot.get('cartList') as List<dynamic>)
          .map(
            (e) => Cart(
                id: e['id'],
                title: e['title'],
                price: e['price'],
                quantity: e['quantity'],
                image: e['image'],
                totalPrice: e['totalPrice']),
          )
          .toList(),
    );
  }
}
