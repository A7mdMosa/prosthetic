part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class UserLoadingEvent extends UserEvent {}

class UserUpdateEvent extends UserEvent {
  final UserModel newUserModel;
  UserUpdateEvent({required this.newUserModel});
}

class UserLogoutEvent extends UserEvent {}
