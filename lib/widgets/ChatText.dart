import 'package:SriTel/theme/colors.dart';
import 'package:flutter/material.dart';

enum ChatTextType { send, receive}

class ChatText extends StatelessWidget {
  final ChatTextType type;
  const ChatText({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 246.0),
      decoration: BoxDecoration(
        color: type == ChatTextType.receive ? SriTelColor.white : SriTelColor.primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
          bottomRight: type == ChatTextType.receive ? Radius.circular(15) : Radius.circular(0),
          bottomLeft: type == ChatTextType.receive ? Radius.circular(0) : Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: SriTelColor.lightGrey,
            blurRadius: 32,
            offset: Offset(0, 8),
            spreadRadius: 0,
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 16,
          right: 10,
          bottom: 8,
          left: 10,
        ),
        child: Column(
          crossAxisAlignment: type == ChatTextType.receive ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            Text(
                'Hello how can I help you?',
              style: TextStyle(
                color: type == ChatTextType.receive ? SriTelColor.titleTextColor : SriTelColor.white,
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '16:04 pm',
              style: TextStyle(
                color: type == ChatTextType.receive ? SriTelColor.grey.withOpacity(0.75) : SriTelColor.lightWhite,
                fontSize: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
