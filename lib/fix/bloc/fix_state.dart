part of 'fix_bloc.dart';

@immutable
abstract class FixState {
  final List<Fix> fixList;
  const FixState(this.fixList);
}

class FixInitial extends FixState {
  const FixInitial(List<Fix> fixList) : super(fixList);
}

class FixLoadingState extends FixState {
  const FixLoadingState(List<Fix> fixList) : super(fixList);
}

class FixLoadedState extends FixState {
  const FixLoadedState(List<Fix> fixList) : super(fixList);
}
