import 'package:SriTel/bindings/all_bindings.dart';
import 'package:SriTel/controllers/auth_controller.dart';
import 'package:SriTel/controllers/package_controller.dart';
import 'package:SriTel/controllers/screen_controller.dart';
import 'package:SriTel/screens/main_page.dart';
import 'package:SriTel/screens/splash_screen.dart';
import 'package:SriTel/services/api_service.dart';
import 'package:SriTel/services/auth_service.dart';
import 'package:SriTel/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ScreenController _screenController = Get.put(ScreenController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    // Force portrait mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    // Change status bar icon color to white
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
    ));

    return GetMaterialApp(
      initialBinding: AllBindings(),
      debugShowCheckedModeBanner: false,
      title: 'SriTel',
      theme: AppTheme.lightTheme,
      home: _screenController.isSplashScreenSeen.value ? const MainPage() : const SplashScreen(),
    );
  }
}
