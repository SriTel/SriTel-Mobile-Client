import 'package:SriTel/theme/colors.dart';
import 'package:SriTel/widgets/panel_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/button.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      // Use Obx(()=> to update Text() whenever count is changed.
      appBar: AppBar(title: Text("Buttons")),
      backgroundColor: SriTelColor.bgColor,
      // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 36.0),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Button(
                leftIcon: const Icon(Icons.add),
                buttonText: "Primary",
                onPressed: () => Get.back()),
            const SizedBox(height: 24),
            Button(
              rightIcon: const Icon(Icons.check),
                type: ButtonType.secondary,
                buttonText: "Secondary",
                onPressed: () => Get.back()),
            const SizedBox(height: 24),
            Button(
                type: ButtonType.primaryColor,
                buttonText: "Primary Color",
                onPressed: () => Get.back()),
            const SizedBox(height: 24),
            Button(
                type: ButtonType.disabled,
                buttonText: "Disabled",
                onPressed: () => Get.back()),
            const SizedBox(height: 24),
            PanelButton(
                buttonText: "Package",
                isActive: true,
                onPressed: () => {},
            ),
            const SizedBox(height: 24),
            PanelButton(
                buttonText: "Add-Ons",
                isActive: false,
                onPressed: () => {},
            ),
            const SizedBox(height: 24),
            Divider(
              color: SriTelColor.white.withOpacity(0.3),
              thickness: 1,
            ),
          ],
        )),
      ),
    );
  }
}
