import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import '../data/repository/news_repository.dart';

import '../data/models/news_model.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository _newsRepository;
  List<News> news = [];

  NewsBloc(this._newsRepository) : super(const NewsInitial([])) {
    on<NewsLoadingEvent>((event, emit) async {
      try {
        //Get news snapshot.
        QuerySnapshot querySnapshot = await _newsRepository.getDocs();
        final List<News> _newNews = [];
        for (int i = 0; i < querySnapshot.docs.length; i++) {
          var snapshot = querySnapshot.docs[i];
          _newNews.add(
            News.fromSnapshot(snapshot),
          );
        }
        news = _newNews;
        print('News Added');
      } catch (e) {
        print(e.toString());
      }
      emit(NewsLoadedState(news));
      print('NewsLoadedState');
    });

    on<NewsAddEvent>((event, emit) async {
      try {
        //Add news.
        await _newsRepository.addNewsData(event.newNews);
        print('News Added');
      } catch (e) {
        print(e.toString());
      }
      emit(NewsLoadedState(news));
      print('NewsLoadedState');
    });
    on<NewsUpdateEvent>((event, emit) async {
      try {
        //update news.
        await _newsRepository.updateNewsData(event.updatedNews);
        print('News updated');
      } catch (e) {
        print(e.toString());
      }
      emit(NewsLoadedState(news));
      print('NewsLoadedState');
    });

    on<NewsDeleteEvent>((event, emit) async {
      try {
        //Delete this news.
        await _newsRepository.deleteNewsData(event.oldNews);
        print('News deleted');
      } catch (e) {
        print(e.toString());
      }
      emit(NewsLoadedState(news));
      print('NewsLoadedState');
    });
  }
}
