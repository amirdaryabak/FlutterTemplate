part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent {}

class SetThemeEvent extends ThemeEvent {
  final ThemeMode themeMode;
  final Language language;

  SetThemeEvent({
    required this.themeMode,
    required this.language,
  });
}
