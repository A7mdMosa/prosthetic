part of 'fix_bloc.dart';

@immutable
abstract class FixEvent {}

class FixAddRequestEvent extends FixEvent {}

class FixGetDataEvent extends FixEvent {}
