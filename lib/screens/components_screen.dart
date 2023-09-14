import 'package:SriTel/screens/buttons_screen.dart';
import 'package:SriTel/screens/input_feild_screen.dart';
import 'package:SriTel/services/auth_service.dart';
import 'package:SriTel/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/button.dart';
import 'cards_screen.dart';

class ComponentsScreen extends StatelessWidget {
  const ComponentsScreen({super.key});

  @override
  Widget build(context) {
    // final authService = Get.find<AuthService>();
    return Scaffold(
      // Use Obx(()=> to update Text() whenever count is changed.
      appBar: AppBar(
        title: Text("SriTel App Components"),
        leading: SizedBox(),
      ),
      backgroundColor: SriTelColor.bgColor,
      // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
      body: Padding(
        padding: const EdgeInsets.only(
            left: 24.0, right: 24.0, bottom: 0.0, top: 16.0),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(
                  rightIcon: const Icon(Icons.arrow_forward_ios),
                  type: ButtonType.primary,
                  buttonText: "Buttons",
                  onPressed: () => Get.to(() => const ButtonsScreen())),
              const SizedBox(height: 24),
              Button(
                  rightIcon: const Icon(Icons.arrow_forward_ios),
                  type: ButtonType.primary,
                  buttonText: "Cards",
                  onPressed: () => Get.to(() => const CardsScreen())),
              const SizedBox(height: 24),
              Button(
                  rightIcon: const Icon(Icons.arrow_forward_ios),
                  type: ButtonType.primary,
                  buttonText: "Input Fields",
                  onPressed: () => Get.to(() => InputScreen())),
              // Button(
              //     rightIcon: const Icon(Icons.arrow_forward_ios),
              //     type: ButtonType.primaryColor,
              //     buttonText: "Logout",
              //     onPressed: () => {authService.forceLogout}),
            ],
          )),
        ),
      ),
    );
  }
}
