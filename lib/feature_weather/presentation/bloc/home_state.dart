part of 'home_bloc.dart';

class HomeState extends Equatable {
  final CwStatus cwStatus;

  const HomeState({
    required this.cwStatus,
  });

  HomeState copyWith({
    CwStatus? newCwStatus,
  }) {
    return HomeState(
      cwStatus: newCwStatus ?? cwStatus,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        cwStatus,
      ];
}
