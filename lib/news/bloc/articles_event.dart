part of 'articles_bloc.dart';

@immutable
abstract class ArticlesEvent {}

class ArticlesLoadingEvent extends ArticlesEvent {}

class ArticlesAddEvent extends ArticlesEvent {
  final Article newArticle;
  ArticlesAddEvent({required this.newArticle});
}

class ArticlesUpdateEvent extends ArticlesEvent {
  final Article updatedArticle;
  ArticlesUpdateEvent({required this.updatedArticle});
}

class ArticlesDeleteEvent extends ArticlesEvent {
  final Article oldArticle;
  ArticlesDeleteEvent({required this.oldArticle});
}
