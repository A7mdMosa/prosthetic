part of 'profile_image_bloc.dart';

@immutable
abstract class ProfileImageEvent {}

class ProfileImageLoadedEvent extends ProfileImageEvent {}

class ProfileImageGetEvent extends ProfileImageEvent {}

class ProfileImageRemoveEvent extends ProfileImageEvent {}
