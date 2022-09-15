import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_template/feature_main/presentation/screens/main_screen.dart';
import 'package:meta/meta.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  int selectedScreenIndex = firstIndex;

  MainBloc() : super(GetSelectedScreenIndexState(selectedScreenIndex: 0)) {
    on<MainEvent>((event, emit) {
      if (event is SetSelectedScreenIndexEvent) {
        selectedScreenIndex = event.selectedScreenIndex;
        emit(GetSelectedScreenIndexState(selectedScreenIndex: selectedScreenIndex));
      }
    });
  }
}
