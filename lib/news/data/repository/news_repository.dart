import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/news_model.dart';

class NewsRepository {
  final firebaseFirestore = FirebaseFirestore.instance;

  Future<QuerySnapshot> getDocs() async {
    QuerySnapshot querySnapshot =
        await firebaseFirestore.collection('news').get();
    return querySnapshot;
  }

  Future<void> addNewsData(News news) async {
    await firebaseFirestore.collection('news').add({
      'title': news.title,
      'image': news.image,
      'tag1': news.tag1,
      'tag2': news.tag2,
      'url': news.url,
    });
  }

  Future<void> updateNewsData(News news) async {
    await firebaseFirestore.collection('news').doc(news.id).update({
      'title': news.title,
      'image': news.image,
      'tag1': news.tag1,
      'tag2': news.tag2,
      'url': news.url,
    });
  }

  Future<void> deleteNewsData(News news) async {
    await firebaseFirestore.collection('news').doc(news.id).delete();
  }
}
