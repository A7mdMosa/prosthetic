import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/news/data/models/article_model.dart';
import '../data/repository/articles_repository.dart';

part 'articles_event.dart';
part 'articles_state.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  final ArticlesRepository _articlesRepository;
  List<Article> articles = [];

  ArticlesBloc(this._articlesRepository) : super(const ArticlesInitial([])) {
    on<ArticlesEvent>((event, emit) {});
    on<ArticlesLoadingEvent>((event, emit) async {
      try {
        //Get articles snapshot.
        QuerySnapshot querySnapshot = await _articlesRepository.getDocs();
        final List<Article> _newArticles = [];
        //Make a list of articles.
        for (int i = 0; i < querySnapshot.docs.length; i++) {
          var snapshot = querySnapshot.docs[i];
          _newArticles.add(
            Article.fromSnapshot(snapshot),
          );
        }
        articles = _newArticles;
        print('Articles Added');
      } catch (e) {
        print(e.toString());
      }
      emit(ArticlesLoadedState(articles));
      print('ArticlesLoadedState');
    });
    on<ArticlesAddEvent>((event, emit) async {
      try {
        //Add new article.
        await _articlesRepository.addArticlesData(event.newArticle);
        print('new article Added');
      } catch (e) {
        print(e.toString());
      }
      emit(ArticlesLoadedState(articles));
      print('ArticlesLoadedState');
    });
    on<ArticlesUpdateEvent>((event, emit) async {
      try {
        //Update this article.
        await _articlesRepository.updateArticlesData(event.updatedArticle);
        print('Articles updated');
      } catch (e) {
        print(e.toString());
      }
      emit(ArticlesLoadedState(articles));
      print('ArticlesLoadedState');
    });

    on<ArticlesDeleteEvent>((event, emit) async {
      try {
        //Delete article.
        await _articlesRepository.deleteArticlesData(event.oldArticle);
        print('Articles deleted');
      } catch (e) {
        print(e.toString());
      }
      emit(ArticlesLoadedState(articles));
      print('NewsLoadedState');
    });
  }
}
