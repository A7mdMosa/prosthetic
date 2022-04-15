part of 'news_bloc.dart';

@immutable
abstract class NewsState {
  final List<News> news;
  const NewsState(this.news);
}

class NewsInitial extends NewsState {
  const NewsInitial(List<News> news) : super(news);
}

class NewsLoadingState extends NewsState {
  const NewsLoadingState(List<News> news) : super(news);
}

class NewsLoadedState extends NewsState {
  const NewsLoadedState(List<News> news) : super(news);
}
