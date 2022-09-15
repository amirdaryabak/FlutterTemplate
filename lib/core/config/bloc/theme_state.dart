part of 'theme_bloc.dart';

@immutable
abstract class ThemeState {}

class SetThemeState extends ThemeState {
  final ThemeMode themeMode;

  SetThemeState({
    required this.themeMode,
  });
}
