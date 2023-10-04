import 'package:SriTel/controllers/package_controller.dart';
import 'package:SriTel/screens/buttons_screen.dart';
import 'package:SriTel/screens/cards_screen.dart';
import 'package:SriTel/screens/chat_widget_screen.dart';
import 'package:SriTel/screens/input_field_screen.dart';
import 'package:SriTel/screens/signin_screen.dart';
import 'package:SriTel/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});
  final PackageController _packageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24),
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
                  buttonText: "Use Data",
                  onPressed: () => _packageController.useDataPackage()),
              const SizedBox(height: 24),
              Button(
                  rightIcon: const Icon(Icons.arrow_forward_ios),
                  type: ButtonType.primary,
                  buttonText: "Use Call",
                  onPressed: () => _packageController.useVoicePackageCalls()),
              const SizedBox(height: 24),
              Button(
                  rightIcon: const Icon(Icons.arrow_forward_ios),
                  type: ButtonType.primary,
                  buttonText: "Use Sms",
                  onPressed: () => _packageController.useVoicePackageSms()),
              const SizedBox(height: 24),
              Button(
                  rightIcon: const Icon(Icons.arrow_forward_ios),
                  type: ButtonType.primary,
                  buttonText: "Sign-Out",
                  onPressed: () => Get.to(() => SignInScreen())),
            ],
          ),
        ),
      ),
    );
  }
}
