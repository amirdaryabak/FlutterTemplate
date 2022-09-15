part of 'main_bloc.dart';

@immutable
abstract class MainEvent {}

class SetSelectedScreenIndexEvent extends MainEvent {
  final int selectedScreenIndex;

  SetSelectedScreenIndexEvent({
    required this.selectedScreenIndex,
  });
}
