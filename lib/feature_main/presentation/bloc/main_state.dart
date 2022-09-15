part of 'main_bloc.dart';

@immutable
abstract class MainState {}

class GetSelectedScreenIndexState extends MainState {
  final int selectedScreenIndex;

  GetSelectedScreenIndexState({
    required this.selectedScreenIndex,
  });
}
