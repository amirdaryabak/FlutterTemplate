import 'package:flutter_template/main_presentation/main_controller.dart';
import 'package:get/get.dart';

class MainScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<MainController>(MainController());
  }
}
