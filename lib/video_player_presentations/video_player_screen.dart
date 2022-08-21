import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_template/video_player_presentations/widget/video_control_panel_widget.dart';
import 'package:flutter_template/video_player_presentations/video_player_controller.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({Key? key}) : super(key: key);

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  final VideoPlayerScreenController _controller = Get.find<VideoPlayerScreenController>();
  late final VideoPlayerController _videoPlayerController = VideoPlayerController.asset('assets/file.mp4')
    ..initialize()
    ..setLooping(true)
    ..play();

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _controller.timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<VideoPlayerScreenController>(
      initState: (_) {},
      builder: (logic) {
        return Scaffold(
          body: Stack(
            children: [
              Center(
                child: SizedBox(
                    height: 300,
                    child: GestureDetector(
                        onTap: () {
                          if (!_controller.showControlPanel.value) {
                            _controller.showControlPanel(true);
                            initControlPanelTimer();
                          }
                        },
                        child: VideoPlayer(_videoPlayerController))),
              ),
              if (_controller.showControlPanel.value)
                VideoControlPanel(
                  controller: _videoPlayerController,
                  gestureTapCallback: () {
                    _controller.showControlPanel(false);
                    _controller.timer?.cancel();
                  },
                ),
            ],
          ),
        );
      },
    );
  }

  void initControlPanelTimer() {
    _controller.timer?.cancel();
    _controller.timer = Timer(const Duration(seconds: 2), () {
      _controller.showControlPanel(false);
    });
  }
}
