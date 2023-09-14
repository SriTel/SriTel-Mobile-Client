import 'package:SriTel/controllers/screen_controller.dart';
import 'package:SriTel/screens/components_screen.dart';
import 'package:SriTel/screens/home_screen.dart';
import 'package:SriTel/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  final ScreenController _screenController = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 2000), (){});
    _screenController.isSplashScreenSeen.value = true;
    Get.to(const ComponentsScreen(), duration: const Duration(milliseconds: 1000),transition: Transition.native);
  }

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [FadeEffect()],
      child: Scaffold(
        backgroundColor: SriTelColor.primaryColor,
        body: Center(
          child: SvgPicture.asset('assets/images/splash_screen_logo.svg'),
        ),
      ),
    );
  }
}