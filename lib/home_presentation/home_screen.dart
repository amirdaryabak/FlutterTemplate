import 'package:flutter/material.dart';
import 'package:flutter_template/core/widgets/main_root_page_widget.dart';
import 'package:flutter_template/music_player_presentation/music_player_screen.dart';
import 'package:flutter_template/video_player_presentations/video_player_screen.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainAppRootWidget(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(
                  () => const MusicPlayerScreen(),
                );
              },
              child: const Text(
                'Music Player',
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50), // NEW
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Get.to(
                  () => const VideoPlayerScreen(),
                );
              },
              child: const Text(
                'Video Player',
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50), // NEW
              ),
            ),
          ],
        ),
      ),
    );
  }
}
