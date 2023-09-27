import 'package:SriTel/screens/buttons_screen.dart';
import 'package:SriTel/screens/cards_screen.dart';
import 'package:SriTel/screens/chat_widget_screen.dart';
import 'package:SriTel/screens/input_field_screen.dart';
import 'package:SriTel/screens/signin_screen.dart';
import 'package:SriTel/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 24),
              // widgets
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
              const SizedBox(height: 24),
              Button(
                  rightIcon: const Icon(Icons.arrow_forward_ios),
                  type: ButtonType.primary,
                  buttonText: "Chat Fields",
                  onPressed: () => Get.to(() => const ChatWidgetScreen())),
              const SizedBox(height: 24),
              Button(
                  rightIcon: const Icon(Icons.arrow_forward_ios),
                  type: ButtonType.primary,
                  buttonText: "Signin",
                  onPressed: () => Get.to(() => SignInScreen())),
            ],
          ),
        ),
      ),
    );
  }
}
