import 'package:flutter/material.dart';
import 'package:flutter_template/bottom_navigation/bottom_navigation.dart';
import 'package:flutter_template/main_presentation/main_controller.dart';
import 'package:flutter_template/test_screen/simple_screen.dart';
import 'package:flutter_template/video_player_presentations/video_player_screen.dart';
import 'package:get/get.dart';

const int firstIndex = 0;
const int secondIndex = 1;
const int thirdIndex = 2;
const double bottomNavigationHeight = 65;

class MainScreen extends StatelessWidget {
  final MainController _controller = Get.find<MainController>();
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

  Future<bool> _onWillPop() async {
    final NavigatorState currentSelectedTabNavigatorState = map[_controller.selectedScreenIndex]!.currentState!;
    if (currentSelectedTabNavigatorState.canPop()) {
      currentSelectedTabNavigatorState.pop();
      return false;
    } else if (_history.isNotEmpty) {
      _controller.selectedScreenIndex(_history.last);
      _history.removeLast();
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: GetX<MainController>(
        initState: (_) {},
        builder: (logic) {
          return Scaffold(
            body: Stack(
              children: [
                Positioned.fill(
                  bottom: bottomNavigationHeight,
                  child: IndexedStack(
                    index: _controller.selectedScreenIndex.value,
                    children: [
                      _navigator(
                        key: _firstScreenKey,
                        index: firstIndex,
                        child: Container(),
                      ),
                      _navigator(
                        key: _secondScreenKey,
                        index: secondIndex,
                        child: const VideoPlayerScreen(),
                      ),
                      _navigator(
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
                    selectedIndex: _controller.selectedScreenIndex.value,
                    onTab: (index) {
                      _history.remove(_controller.selectedScreenIndex.value);
                      _history.add(_controller.selectedScreenIndex.value);
                      _controller.selectedScreenIndex(index);
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _navigator({required GlobalKey key, required int index, required Widget child}) {
    return key.currentState == null && _controller.selectedScreenIndex.value != index
        ? Container()
        : Navigator(
            key: key,
            onGenerateRoute: (settings) => MaterialPageRoute(
              builder: (context) => Offstage(
                offstage: _controller.selectedScreenIndex.value != index,
                child: child,
              ),
            ),
          );
  }
}