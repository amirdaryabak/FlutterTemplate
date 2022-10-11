import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_template/feature_video_player/presentation/widgets/video_control_panel_widget.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({Key? key}) : super(key: key);

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late final VideoPlayerController _videoPlayerController = VideoPlayerController.asset('assets/file.mp4')
    ..initialize()
    ..setLooping(true)
    ..play();
  bool showControlPanel = true;
  Timer? timer;

  @override
  void dispose() {
    _videoPlayerController.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SizedBox(
                height: 300,
                child: GestureDetector(
                    onTap: () {
                      if (!showControlPanel) {
                        setState(() {
                          showControlPanel = true;
                        });
                        initControlPanelTimer();
                      }
                    },
                    child: VideoPlayer(_videoPlayerController),),),
          ),
          if (showControlPanel)
            VideoControlPanel(
              controller: _videoPlayerController,
              gestureTapCallback: () {
                setState(() {
                  showControlPanel = false;
                });
                timer?.cancel();
              },
            ),
        ],
      ),
    );
  }

  void initControlPanelTimer() {
    timer?.cancel();
    timer = Timer(const Duration(seconds: 2), () {
      setState(() {
        showControlPanel = false;
      });
    });
  }
}
