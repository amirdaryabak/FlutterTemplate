import 'package:flutter/material.dart';
import 'package:flutter_template/core/widgets/main_root_page_widget.dart';
import 'package:flutter_template/feature_weather/presentation/screens/weather_screen.dart';
import 'package:flutter_template/feature_music_player/presentation/screens/music_player_screen.dart';
import 'package:flutter_template/feature_video_player/presentation/screens/video_player_screen.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainAppRootWidget(
      backgroundColor: Colors.blueGrey,
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
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50), // NEW
              ),
              child: const Text(
                'Music Player',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Get.to(
                  () => const VideoPlayerScreen(),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50), // NEW
              ),
              child: const Text(
                'Video Player',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const WeatherScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50), // NEW
              ),
              child: const Text(
                'Weather Screenr',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
