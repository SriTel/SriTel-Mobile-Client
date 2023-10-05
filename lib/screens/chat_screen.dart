import 'package:SriTel/theme/colors.dart';
import 'package:SriTel/widgets/ChatText.dart';
import 'package:SriTel/widgets/chat_input_box.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  final TextEditingController _chatTextController = TextEditingController();


  void _handleSendMessage(String message) {
    // do required logics
    print('Sending message: $message');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Container(
              height: 52,
              width: 52,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/telco-support.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Telco Support',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  'online',
                  style: TextStyle(
                      fontSize: 14,
                      color: SriTelColor.grey
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Expanded(
                child: Column(
                  children: [
                    ChatText(
                      type: ChatTextType.receive,
                      text: 'Hi, How can I help you?',
                      dateTime: DateTime.now(),
                    ),
                    const SizedBox(height: 24),
                    ChatText(
                      type: ChatTextType.send,
                      text: 'I need assistance on how to activate this package',
                      dateTime: DateTime.now(),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
          // const SizedBox(
          //   height: 16,
          // ),
          ChatInputBox(
            textController: _chatTextController,
            onSendMessage: _handleSendMessage,
          )
        ],
      ),
    );
  }
}
