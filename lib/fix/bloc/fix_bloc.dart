import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import '../data/repository/fix_repository.dart';

import '../data/models/fix.dart';

part 'fix_event.dart';
part 'fix_state.dart';

class FixBloc extends Bloc<FixEvent, FixState> {
  List<Fix> fixList = [];
  final FixRepository _fixRepository;
  FixBloc(this._fixRepository) : super(const FixInitial([])) {
    on<FixEvent>((event, emit) {});
    on<FixAddRequestEvent>((event, emit) async {
      emit(
        FixLoadingState(fixList),
      );
      try {
        //Send fix request.
        await _fixRepository.sendFixRequest();
      } catch (e) {
        print(e);
      }
      emit(
        FixLoadedState(fixList),
      );
    });
    on<FixGetDataEvent>(
      ((event, emit) async {
        try {
          //Get fix data.
          QuerySnapshot querySnapshot = await _fixRepository.getDocs();
          final List<Fix> _newFixList = [];
          for (int i = 0; i < querySnapshot.docs.length; i++) {
            var snapshot = querySnapshot.docs[i];
            _newFixList.add(
              Fix.fromSnapshot(snapshot),
            );
          }
          fixList = _newFixList;
        } catch (e) {
          print(e.toString());
        }
        emit(FixLoadedState(fixList));
      }),
    );
  }
}
