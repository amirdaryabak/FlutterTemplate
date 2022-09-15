import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/core/widgets/bottom_navigation/bottom_navigation.dart';
import 'package:flutter_template/feature_home/presentation/screens/home_screen.dart';
import 'package:flutter_template/feature_main/presentation/bloc/main_bloc.dart';
import 'package:flutter_template/core/utils/simple_screen.dart';

const int firstIndex = 0;
const int secondIndex = 1;
const int thirdIndex = 2;
const double bottomNavigationHeight = 65;

class MainScreen extends StatelessWidget {
  final List<int> _history = [];

  MainScreen({
    Key? key,
  }) : super(key: key);

  final GlobalKey<NavigatorState> _firstScreenKey = GlobalKey();
  final GlobalKey<NavigatorState> _secondScreenKey = GlobalKey();
  final GlobalKey<NavigatorState> _thirdScreenKey = GlobalKey();

  late final map = {
    firstIndex: _firstScreenKey,
    secondIndex: _secondScreenKey,
    thirdIndex: _thirdScreenKey,
  };

  Future<bool> _onWillPop(BuildContext context) async {
    MainBloc mainBloc = BlocProvider.of<MainBloc>(context);
    final NavigatorState currentSelectedTabNavigatorState = map[mainBloc.selectedScreenIndex]!.currentState!;
    if (currentSelectedTabNavigatorState.canPop()) {
      currentSelectedTabNavigatorState.pop();
      return false;
    } else if (_history.isNotEmpty) {
      BlocProvider.of<MainBloc>(context).add(
        SetSelectedScreenIndexEvent(
          selectedScreenIndex: _history.last,
        ),
      );
      _history.removeLast();
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return _onWillPop(context);
      },
      child: Scaffold(
        body: BlocBuilder<MainBloc, MainState>(
          builder: (context, state) {
            if (state is GetSelectedScreenIndexState) {
              return Stack(
                children: [
                  Positioned.fill(
                    bottom: bottomNavigationHeight,
                    child: IndexedStack(
                      index: state.selectedScreenIndex,
                      children: [
                        _navigator(
                          context,
                          key: _firstScreenKey,
                          index: firstIndex,
                          child: const HomeScreen(),
                        ),
                        _navigator(
                          context,
                          key: _secondScreenKey,
                          index: secondIndex,
                          child: Container(),
                        ),
                        _navigator(
                          context,
                          key: _thirdScreenKey,
                          index: thirdIndex,
                          child: const SimpleScreen(
                            tabName: 'Third',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    left: 0,
                    bottom: 0,
                    child: BottomNavigation(
                      selectedIndex: state.selectedScreenIndex,
                      onTab: (index) {
                        _history.remove(state.selectedScreenIndex);
                        _history.add(state.selectedScreenIndex);
                        BlocProvider.of<MainBloc>(context).add(
                          SetSelectedScreenIndexEvent(
                            selectedScreenIndex: index,
                          ),
                        );
                      },
                    ),
                  )
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _navigator(
    BuildContext context, {
    required GlobalKey key,
    required int index,
    required Widget child,
  }) {
    MainBloc mainBloc = BlocProvider.of<MainBloc>(context);
    return key.currentState == null && mainBloc.selectedScreenIndex != index
        ? Container()
        : Navigator(
            key: key,
            onGenerateRoute: (settings) => MaterialPageRoute(
              builder: (context) => Offstage(
                offstage: mainBloc.selectedScreenIndex != index,
                child: child,
              ),
            ),
          );
  }
}
