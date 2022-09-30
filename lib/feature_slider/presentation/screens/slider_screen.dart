import 'package:flutter/material.dart';
import 'package:flutter_template/core/widgets/main_root_page_widget.dart';
import 'package:flutter_template/feature_slider/presentation/widgets/banner_slider.dart';
import 'package:flutter_template/feature_slider/presentation/widgets/carousel_slider_widget.dart';
import 'package:flutter_template/gen/assets.gen.dart';

class SliderScreen extends StatelessWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainAppRootWidget(
      child: Column(
        children: [
          const SizedBox(height: 24),
          Container(
            color: Colors.grey,
            child: BannerSlider(
              banners: [
                Assets.flutterLogoPng.path,
                Assets.musicCover.path,
                Assets.flutterLogoPng.path,
                Assets.musicCover.path,
              ],
            ),
          ),
          const SizedBox(height: 24),
          const CarouselSliderWidget(),
        ],
      ),
    );
  }
}