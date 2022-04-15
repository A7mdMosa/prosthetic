part of 'news_bloc.dart';

@immutable
abstract class NewsEvent {}

class NewsLoadingEvent extends NewsEvent {}

class NewsAddEvent extends NewsEvent {
  final News newNews;
  NewsAddEvent({required this.newNews});
}

class NewsUpdateEvent extends NewsEvent {
  final News updatedNews;
  NewsUpdateEvent({required this.updatedNews});
}

class NewsDeleteEvent extends NewsEvent {
  final News oldNews;
  NewsDeleteEvent({required this.oldNews});
}
