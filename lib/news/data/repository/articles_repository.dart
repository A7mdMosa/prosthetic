import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/article_model.dart';

class ArticlesRepository {
  final firebaseFirestore = FirebaseFirestore.instance;

  Future<QuerySnapshot> getDocs() async {
    QuerySnapshot querySnapshot =
        await firebaseFirestore.collection('articles').get();
    return querySnapshot;
  }

  Future<void> addArticlesData(Article article) async {
    await firebaseFirestore.collection('articles').add({
      'title': article.title,
      'description': article.description,
      'image': article.image,
      'tag1': article.tag1,
      'tag2': article.tag2,
      'article': article.article,
    });
  }

  Future<void> updateArticlesData(Article article) async {
    await firebaseFirestore.collection('articles').doc(article.id).update({
      'title': article.title,
      'description': article.description,
      'image': article.image,
      'tag1': article.tag1,
      'tag2': article.tag2,
      'article': article.article,
    });
  }

  Future<void> deleteArticlesData(Article article) async {
    await firebaseFirestore.collection('articles').doc(article.id).delete();
  }
}
