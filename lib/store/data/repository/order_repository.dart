import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/order.dart';

class OrderRepository {
  final _firebaseFirestore = FirebaseFirestore.instance;
  final _firebaseAuth = FirebaseAuth.instance;

  Future<QuerySnapshot> getDocs() async {
    QuerySnapshot querySnapshot = await _firebaseFirestore
        .collection('orders')
        .doc()
        .collection('orders')
        .get();
    return querySnapshot;
  }

  Future<QuerySnapshot> getUserDocs() async {
    QuerySnapshot querySnapshot = await _firebaseFirestore
        .collection('orders')
        .doc(_firebaseAuth.currentUser!.email)
        .collection('orders')
        .get();
    return querySnapshot;
  }

  Future<void> addOrderData(Order order) async {
    await _firebaseFirestore
        .collection('orders')
        .doc(_firebaseAuth.currentUser!.email)
        .collection('orders')
        .add({
      'id': order.id,
      'total': order.total,
      'userName': _firebaseAuth.currentUser!.email,
      'phoneNumber': order.phoneNumber,
      'addressLine2': order.addressLine2,
      'addressLine1': order.addressLine1,
      'country': order.country,
      'city': order.city,
      'dateTime': order.dateTime.toIso8601String(),
      'cartList': order.cartList
          .map((cartItem) => {
                'id': cartItem.id,
                'title': cartItem.title,
                'price': cartItem.price,
                'quantity': cartItem.quantity,
                'image': cartItem.image,
                'totalPrice': cartItem.totalPrice
              })
          .toList()
    });
  }
}
