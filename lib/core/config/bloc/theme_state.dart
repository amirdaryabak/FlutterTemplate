part of 'theme_bloc.dart';

@immutable
abstract class ThemeState {}

class SetThemeState extends ThemeState {
  final ThemeMode themeMode;
  final Language language;

  SetThemeState({
    required this.themeMode,
    required this.language,
  });
}
