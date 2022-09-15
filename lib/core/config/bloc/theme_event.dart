part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent {}

class SetThemeEvent extends ThemeEvent {
  final ThemeMode themeMode;

  SetThemeEvent({
    required this.themeMode,
  });
}
