import 'package:SriTel/theme/colors.dart';
import 'package:SriTel/widgets/ChatText.dart';
import 'package:SriTel/widgets/panel_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/button.dart';

class ChatWidgetScreen extends StatelessWidget {
  const ChatWidgetScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      // Use Obx(()=> to update Text() whenever count is changed.
      appBar: AppBar(title: Text("Chat")),
      backgroundColor: SriTelColor.bgColor,
      // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 36.0),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ChatText(
              type: ChatTextType.receive,
            ),
            const SizedBox(height: 24),
            ChatText(
              type: ChatTextType.send,
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
