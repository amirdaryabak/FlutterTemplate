import 'package:flutter/material.dart';
import 'package:flutter_template/core/widgets/main_button_widget.dart';
import 'package:flutter_template/core/widgets/main_root_page_widget.dart';
import 'package:flutter_template/feature_map/data/repository/map_repository_imp.dart';
import 'package:flutter_template/feature_map/domain/repository/map_repository.dart';
import 'package:flutter_template/feature_map/presentation/screens/map_screen.dart';
import 'package:flutter_template/feature_music_player/presentation/screens/music_player_screen.dart';
import 'package:flutter_template/feature_slider/presentation/screens/slider_screen.dart';
import 'package:flutter_template/feature_video_player/presentation/screens/video_player_screen.dart';
import 'package:flutter_template/feature_weather/presentation/screens/weather_screen.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/locator.dart';
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
            MainButtonWidget(
              isEnabled: true,
              text: 'Music Player',
              onTap: () {
                Get.to(
                  () => const MusicPlayerScreen(),
                );
              },
            ),
            const SizedBox(height: 16),
            MainButtonWidget(
              isEnabled: true,
              text: 'Video Player',
              onTap: () {
                Get.to(
                  () => const VideoPlayerScreen(),
                );
              },
            ),
            const SizedBox(height: 16),
            MainButtonWidget(
              isEnabled: true,
              text: 'Weather Screenr',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const WeatherScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            MainButtonWidget(
              isEnabled: true,
              text: 'Map Screen',
              onTap: () {
                Get.put<MapRepository>(MapRepositoryImpl(locator.get()));
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MapScreen(
                      primaryColor: Theme.of(context).primaryColor,
                      pinPurpleIconSvg: Assets.pinMapIcon.path,
                      onGetOffAll: () {},
                      funNavigation: () {},
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            MainButtonWidget(
              isEnabled: true,
              text: 'Slider Screen',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SliderScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
