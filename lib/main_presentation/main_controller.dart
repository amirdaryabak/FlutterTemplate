import 'package:flutter/material.dart';
import 'package:flutter_template/main_presentation/main_screen.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt selectedScreenIndex = firstIndex.obs;
  Rx<ThemeMode> themeMode = ThemeMode.light.obs;

}
