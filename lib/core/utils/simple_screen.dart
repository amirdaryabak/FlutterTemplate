import 'package:flutter/material.dart';
import 'package:flutter_template/main_presentation/main_controller.dart';
import 'package:get/get.dart';

class SimpleScreen extends StatelessWidget {
  const SimpleScreen({
    Key? key,
    required this.tabName,
    this.screenNumber = 1,
  }) : super(key: key);
  final String tabName;
  final int screenNumber;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Tab: $tabName, Screen #$screenNumber',
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SimpleScreen(
                    tabName: tabName,
                    screenNumber: screenNumber + 1,
                  ),
                ),
              );
            },
            child: const Text(
              'Click Me',
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              if (Get.find<MainController>().themeMode.value == ThemeMode.dark) {
                Get.find<MainController>().themeMode(ThemeMode.light);
              } else {
                Get.find<MainController>().themeMode(ThemeMode.dark);
              }
            },
            child: const Text(
              'Change Theme',
            ),
          ),
        ],
      ),
    );
  }
}
