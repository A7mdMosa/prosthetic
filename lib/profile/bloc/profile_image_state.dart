part of 'profile_image_bloc.dart';

@immutable
abstract class ProfileImageState {
  final String url;
  const ProfileImageState(this.url);
}

class ProfileImageInitial extends ProfileImageState {
  const ProfileImageInitial(String url) : super(url);
}

class ProfileImageLoadingState extends ProfileImageState {
  const ProfileImageLoadingState(String url) : super(url);
}

class ProfileImageGetUrlState extends ProfileImageState {
  const ProfileImageGetUrlState(String url) : super(url);
}
