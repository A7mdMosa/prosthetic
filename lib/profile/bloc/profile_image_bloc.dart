import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../data/repository/image_repository.dart';

part 'profile_image_event.dart';
part 'profile_image_state.dart';

class ProfileImageBloc extends Bloc<ProfileImageEvent, ProfileImageState> {
  ImageRepository imageRepository;
  String url =
      'https://firebasestorage.googleapis.com/v0/b/prosthetic-8656c.appspot.com/o/profile.png?alt=media&token=6e8151d1-a14e-42ee-b081-67299539d89a';

  ProfileImageBloc(this.imageRepository)
      : super(const ProfileImageInitial('')) {
    on<ProfileImageEvent>((event, emit) {});

    on<ProfileImageLoadedEvent>((event, emit) async {
      try {
        await imageRepository.uploadImage();
        print('profile image loaded');
      } catch (e) {
        print(e);
      }
      emit(ProfileImageLoadingState(url));
    });

    on<ProfileImageGetEvent>((event, emit) async {
      try {
        url = await imageRepository.getImageUrl();
        print('profile get image');
        print(url);
      } catch (e) {
        print(e);
      }
      emit(ProfileImageGetUrlState(url));
    });

    on<ProfileImageRemoveEvent>((event, emit) async {
      try {
        await imageRepository.deleteImage();
        url =
            'https://firebasestorage.googleapis.com/v0/b/prosthetic-8656c.appspot.com/o/profile.png?alt=media&token=6e8151d1-a14e-42ee-b081-67299539d89a';
        print('profile remove image');
      } catch (e) {
        print(e);
      }
      emit(ProfileImageGetUrlState(url));
    });
  }
}
