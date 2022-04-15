import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../data/models/user_model.dart';

import '../data/repository/profile_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  late UserModel userModel;
  ProfileRepository profileRepository;
  UserBloc(this.profileRepository)
      : super(
          UserInitial(
            UserModel(
                id: '',
                firstName: '',
                lastName: '',
                email: '',
                age: 0,
                image: '',
                job: '',
                location: '',
                prostheticLimb: ''),
          ),
        ) {
    on<UserEvent>((event, emit) {});
    on<UserLoadingEvent>((event, emit) async {
      final snapshot = await profileRepository.getUserData();
      userModel = UserModel.fromSnapshot(snapshot);
      print(userModel.email);
      emit(
        UserLoadedState(userModel),
      );
      print('LOADED');
    });
    on<UserUpdateEvent>((event, emit) async {
      emit(
        UserLoadingState(userModel),
      );
      await profileRepository.updateUserData(event.newUserModel);
      print('LOADING');
      emit(
        UserLoadedState(userModel),
      );
    });
    on<UserLogoutEvent>((event, emit) async {
      await profileRepository.logout();
    });
  }
}
