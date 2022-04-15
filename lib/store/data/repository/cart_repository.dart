import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/cart.dart';

class CartRepository {
  final _firebaseFirestore = FirebaseFirestore.instance;
  final _firebaseAuth = FirebaseAuth.instance;

  Future<QuerySnapshot> getCartDocs() async {
    QuerySnapshot querySnapshot = await _firebaseFirestore
        .collection('cart')
        .doc(_firebaseAuth.currentUser!.uid)
        .collection('cart')
        .get();
    return querySnapshot;
  }

  Future<void> addCartData(Cart cart) async {
    await _firebaseFirestore
        .collection('cart')
        .doc(_firebaseAuth.currentUser!.uid)
        .collection('cart')
        .doc(cart.id)
        .set({
      'title': cart.title,
      'image': cart.image,
      'price': cart.price,
      'quantity': cart.quantity,
      'totalPrice': cart.totalPrice,
    });
  }

  Future<void> updateCartData(Cart cart) async {
    await _firebaseFirestore
        .collection('cart')
        .doc(_firebaseAuth.currentUser!.uid)
        .collection('cart')
        .doc(cart.id)
        .update({
      'title': cart.title,
      'image': cart.image,
      'price': cart.price,
      'quantity': cart.quantity,
      'totalPrice': cart.price * cart.quantity,
    });
  }

  Future<void> deleteCartData(Cart cart) async {
    await _firebaseFirestore
        .collection('cart')
        .doc(_firebaseAuth.currentUser!.uid)
        .collection('cart')
        .doc(cart.id)
        .delete();
  }

  Future<void> clearCartData() async {
    await _firebaseFirestore
        .collection('cart')
        .doc(_firebaseAuth.currentUser!.uid)
        .delete();
  }
}
