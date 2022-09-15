import 'package:flutter/material.dart';
import 'package:flutter_template/core/widgets/bottom_navigation/bottom_navigation_item.dart';
import 'package:flutter_template/feature_main/presentation/screens/main_screen.dart';
import 'package:flutter_template/gen/assets.gen.dart';

class BottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onTab;

  const BottomNavigation({
    Key? key,
    required this.selectedIndex,
    required this.onTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BottomNavigationItem(
          iconFileName: Assets.test.svg(width: 16, height: 16),
          activeIconFileName: Assets.test.svg(width: 16, height: 16),
          title: 'First',
          isActive: selectedIndex == firstIndex,
          onTap: () {
            onTab(firstIndex);
          },
        ),
        BottomNavigationItem(
          iconFileName: Assets.test.svg(width: 16, height: 16),
          activeIconFileName: Assets.test.svg(width: 16, height: 16),
          title: 'Second',
          isActive: selectedIndex == secondIndex,
          onTap: () {
            onTab(secondIndex);
          },
        ),
        BottomNavigationItem(
          iconFileName: Assets.test.svg(width: 16, height: 16),
          activeIconFileName: Assets.test.svg(width: 16, height: 16),
          title: 'Third',
          isActive: selectedIndex == thirdIndex,
          onTap: () {
            onTab(thirdIndex);
          },
        ),
      ],
    );
  }
}