import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/utils/duration_extensions.dart';
import 'package:flutter_template/music_player_presentation/music_player_controller.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class MusicPlayerScreen extends StatefulWidget {
  const MusicPlayerScreen({Key? key}) : super(key: key);

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  final MusicPlayerScreenController _controller = Get.find<MusicPlayerScreenController>();
  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    audioPlayer.setAsset('assets/testMusic.mp3').then((value) {
      _controller.duration = value;
      audioPlayer.play();
      _controller.timer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
        setState(() {});
      });
      setState(() {});
    });

    super.initState();
  }

  @override
  Future<void> dispose() async {
    await audioPlayer.pause();
    await audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: ExactAssetImage(
                      'assets/musicCover.jpg',
                    ),
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 30,
                    sigmaY: 30,
                  ),
                  child: Container(
                    color: Colors.black26,
                  ),
                ),
              )),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/musicCover.jpg',
                        height: 100,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Sting',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            Text(
                              '@sting',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            CupertinoIcons.heart,
                            color: Colors.white,
                          ))
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.asset(
                          'assets/musicCover.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 24, right: 24),
                    child: Text(
                      'A Thousand Years',
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 24, right: 24),
                    child: Text(
                      'Sting',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  if (_controller.duration != null)
                    Slider(
                      inactiveColor: Colors.white12,
                      activeColor: Colors.white,
                      max: _controller.duration!.inMilliseconds.toDouble(),
                      value: audioPlayer.position.inMilliseconds.toDouble(),
                      onChangeStart: (value) {
                        audioPlayer.pause();
                      },
                      onChangeEnd: (value) {
                        audioPlayer.play();
                      },
                      onChanged: (value) {
                        audioPlayer.seek(Duration(milliseconds: value.toInt()));
                      },
                    ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24, right: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          audioPlayer.position.toMinutesSeconds(),
                          style: const TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        if (_controller.duration != null)
                          Text(
                            _controller.duration!.toMinutesSeconds(),
                            style: const TextStyle(color: Colors.white, fontSize: 12),
                          ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            CupertinoIcons.backward_fill,
                            color: Colors.white,
                          )),
                      GestureDetector(
                        onTap: () {
                          if (audioPlayer.playing) {
                            audioPlayer.pause();
                          } else {
                            audioPlayer.play();
                          }
                        },
                        child: Container(
                            width: 56,
                            height: 56,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [BoxShadow(color: Color(0x5574FF7E), blurRadius: 20, offset: Offset(0, 3))],
                              gradient: LinearGradient(colors: [
                                Color(0xff74FF7E),
                                Color(0xff73C679),
                              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                            ),
                            child: Icon(
                              audioPlayer.playing ? CupertinoIcons.pause : CupertinoIcons.play_fill,
                              color: Colors.white,
                              size: 32,
                            )),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            CupertinoIcons.forward_fill,
                            color: Colors.white,
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}