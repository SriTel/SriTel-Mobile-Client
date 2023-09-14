import 'package:SriTel/theme/colors.dart';
import 'package:SriTel/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/button.dart';

class InputScreen extends StatelessWidget {
  InputScreen({super.key});
  TextEditingController emailController = TextEditingController();

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
            InputField(
              labelText: 'Email',
              controller: emailController,
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
