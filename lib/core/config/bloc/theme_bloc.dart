import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/config/language_enum.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeMode themeMode = ThemeMode.light;
  Language language = Language.en;

  ThemeBloc()
      : super(SetThemeState(
          themeMode: ThemeMode.light,
          language: Language.en,
        )) {
    on<ThemeEvent>((event, emit) {
      if (event is SetThemeEvent) {
        themeMode = event.themeMode;
        language = event.language;
        emit(
          SetThemeState(
            themeMode: event.themeMode,
            language: event.language,
          ),
        );
      }
    });
  }
}
