import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeMode themeMode = ThemeMode.light;

  ThemeBloc() : super(SetThemeState(themeMode: ThemeMode.light)) {
    on<ThemeEvent>((event, emit) {
      if (event is SetThemeEvent) {
        themeMode = event.themeMode;
        emit(SetThemeState(themeMode: event.themeMode));
      }
    });
  }
}
