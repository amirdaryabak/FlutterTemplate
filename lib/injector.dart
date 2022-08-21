import 'package:flutter_template/main_presentation/main_controller.dart';
import 'package:flutter_template/video_player_presentations/video_player_controller.dart';
import 'package:get/get.dart';

abstract class Injector {
  static Future<void> initDependencies() async {
    Get.put<MainController>(
      MainController(),
    );

    Get.put<VideoPlayerScreenController>(
      VideoPlayerScreenController(),
    );
  }
}