part of 'user_bloc.dart';

@immutable
abstract class UserState {
  final UserModel userModel;
  const UserState(this.userModel);
}

class UserInitial extends UserState {
  const UserInitial(UserModel userModel) : super(userModel);
}

class UserLoadedState extends UserState {
  const UserLoadedState(UserModel userModel) : super(userModel);
}

class UserLoadingState extends UserState {
  const UserLoadingState(UserModel userModel) : super(userModel);
}
