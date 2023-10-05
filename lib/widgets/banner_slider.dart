import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class BannerSlider extends StatelessWidget {
  final int currentIndex;
  final List<Widget> bannerItems;
  final Function(int, CarouselPageChangedReason) onPageChanged;

  BannerSlider({
    super.key,
    required this.currentIndex,
    required this.bannerItems,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: bannerItems,
          options: CarouselOptions(
            onPageChanged: onPageChanged,
            viewportFraction: 1,
            autoPlay: true, // We handle auto-sliding manually
          ),
        ),
        DotsIndicator(
          dotsCount: bannerItems.length,
          position: currentIndex.toInt(),
          decorator: const DotsDecorator(
            color: Colors.grey, // Inactive dot color
            activeColor: Colors.blue, // Active dot color
            size: Size.square(8.0), // Dot size
            activeSize: Size.square(8.0), // Active dot size
            spacing: EdgeInsets.all(4.0), // Spacing between dots
          ),
        ),
      ],
    );
  }
}