import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_template/core/utils/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerSlider extends StatefulWidget {
  final List<String> banners;

  const BannerSlider({
    Key? key,
    required this.banners,
  }) : super(key: key);

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  final PageController _pageController = PageController();
  bool _isUserScrolled = false;
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    initTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.banners.length,
              physics: Constants.mainScrollPhysics,
              onPageChanged: (index) {
                if (_isUserScrolled == false) {
                  if (index != _currentPage) {
                    _isUserScrolled = true;
                  }
                }
              },
              itemBuilder: (context, index) => _Slide(banner: widget.banners[index]),
            ),
          ),
          const SizedBox(height: 24),
          Center(
            child: SmoothPageIndicator(
              controller: _pageController,
              count: widget.banners.length,
              effect: WormEffect(
                spacing: 4.0,
                radius: 4.0,
                dotWidth: 20.0,
                dotHeight: 2.0,
                dotColor: Colors.grey.shade400,
                activeDotColor: Theme.of(context).colorScheme.onBackground,
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  void initTimer() {
    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (_isUserScrolled == false) {
        if (_currentPage < widget.banners.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        animatePageView();
      }
    });
  }

  void animatePageView() {
    _pageController.animateToPage(
      _currentPage,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeIn,
    );
  }
}

class _Slide extends StatelessWidget {
  final String banner;

  const _Slide({
    Key? key,
    required this.banner,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Image.asset(banner),
    );
  }
}
