part of 'articles_bloc.dart';

@immutable
abstract class ArticlesState {
  final List<Article> articles;
  const ArticlesState(this.articles);
}

class ArticlesInitial extends ArticlesState {
  const ArticlesInitial(List<Article> articles) : super(articles);
}

class ArticlesLoadingState extends ArticlesState {
  const ArticlesLoadingState(List<Article> articles) : super(articles);
}

class ArticlesLoadedState extends ArticlesState {
  const ArticlesLoadedState(List<Article> articles) : super(articles);
}
