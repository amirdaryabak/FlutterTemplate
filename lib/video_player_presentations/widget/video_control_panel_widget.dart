import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/utils/duration_extensions.dart';
import 'package:video_player/video_player.dart';

class VideoControlPanel extends StatefulWidget {
  const VideoControlPanel({
    Key? key,
    required VideoPlayerController controller,
    required this.gestureTapCallback,
  })  : _controller = controller,
        super(key: key);

  final VideoPlayerController _controller;
  final GestureTapCallback gestureTapCallback;

  @override
  State<VideoControlPanel> createState() => _VideoControlPanelState();
}

class _VideoControlPanelState extends State<VideoControlPanel> {
  Timer? timer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: GestureDetector(
        onTap: widget.gestureTapCallback,
        child: Container(
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
          child: Padding(
            padding: const EdgeInsets.only(left: 16, top: 48, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Test Name',
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Test Name',
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    VideoProgressIndicator(
                      widget._controller,
                      allowScrubbing: true,
                      colors: const VideoProgressColors(playedColor: Colors.white, backgroundColor: Colors.white10),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget._controller.value.position.toMinutesSeconds(),
                            style: const TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          Text(
                            widget._controller.value.duration.toMinutesSeconds(),
                            style: const TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              widget._controller.seekTo(Duration(milliseconds: widget._controller.value.position.inMilliseconds - 2000));
                              setState(() {});
                            },
                            iconSize: 24,
                            icon: const Icon(
                              CupertinoIcons.backward_fill,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              if (widget._controller.value.isPlaying) {
                                widget._controller.pause();
                                setState(() {});
                              } else {
                                widget._controller.play();
                                setState(() {});
                              }
                            },
                            iconSize: 56,
                            icon: Icon(
                              widget._controller.value.isPlaying ? CupertinoIcons.pause_circle_fill : CupertinoIcons.play_circle_fill,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              widget._controller.seekTo(Duration(milliseconds: widget._controller.value.position.inMilliseconds + 2000));
                              setState(() {});
                            },
                            iconSize: 24,
                            icon: const Icon(
                              CupertinoIcons.forward_fill,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}