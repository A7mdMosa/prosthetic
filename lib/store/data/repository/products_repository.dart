import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/product.dart';

class ProductsRepository {
  final firebaseFirestore = FirebaseFirestore.instance;

  Future<QuerySnapshot> getProductsDocs() async {
    QuerySnapshot querySnapshot =
        await firebaseFirestore.collection('products').get();
    return querySnapshot;
  }

  Future<void> addProductData(Product product) async {
    await firebaseFirestore.collection('products').add({
      'title': product.title,
      'image': product.image,
      'price': product.price,
      'description1': product.description1,
      'description2': product.description2,
      'description3': product.description3,
      'description4': product.description4,
      'description5': product.description5,
    });
  }

  Future<void> updateProductData(Product product) async {
    await firebaseFirestore.collection('products').doc(product.id).update({
      'title': product.title,
      'image': product.image,
      'price': product.price,
      'description1': product.description1,
      'description2': product.description2,
      'description3': product.description3,
      'description4': product.description4,
      'description5': product.description5,
    });
  }

  Future<void> deleteProductData(Product product) async {
    await firebaseFirestore.collection('products').doc(product.id).delete();
  }
}
