import 'dart:async';

import 'package:SriTel/widgets/banner_slider.dart';
import 'package:SriTel/widgets/card.dart';
import 'package:SriTel/widgets/featured_package_widget.dart';
import 'package:SriTel/widgets/quick_access_widget.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CarouselController _carouselController = CarouselController();
  int _currentBannerIndex = 0;

  void startAutoSlide() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_currentBannerIndex < 2) {
        _carouselController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        _carouselController.animateToPage(
          0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 24.0, right: 24.0, bottom: 0.0, top: 16.0),
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24.0),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BannerSlider(
                  currentIndex: _currentBannerIndex,
                  bannerItems: [
                    Image.asset('assets/images/banner1.png'),
                    Image.asset('assets/images/banner2.png'),
                    Image.asset('assets/images/banner3.png'),
                  ],
                  onPageChanged: (index, reason) { // Adjust the callback to include CarouselPageChangedReason
                    setState(() {
                      _currentBannerIndex = index;
                    });
                  },
                ),

                // quick access
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Quick Actions',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          QuickAccessWidget(
                            label: 'Balance',
                            onTap: (){},
                          ),
                          QuickAccessWidget(
                            label: 'Add-On',
                            onTap: (){},
                          ),
                          QuickAccessWidget(
                            label: 'History',
                            onTap: (){},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // feature packages
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Featured Packages',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          FeaturedPackageWidget(
                            data: 10,
                            validDays: 7,
                            price: 69,
                            onTap: (){},
                          ),
                          const SizedBox(width: 15),
                          FeaturedPackageWidget(
                            data: 18,
                            validDays: 14,
                            price: 169,
                            type: CardType.extragb3,
                            onTap: (){},
                          ),
                          const SizedBox(width: 15),
                          FeaturedPackageWidget(
                            data: 28,
                            validDays: 14,
                            price: 259,
                            type: CardType.extragb2,
                            onTap: (){},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),



                // Button(
                //     rightIcon: const Icon(Icons.arrow_forward_ios),
                //     type: ButtonType.primaryColor,
                //     buttonText: "Logout",
                //     onPressed: () => {authService.forceLogout}),
              ],
            )),
      ),
    );
  }
}
