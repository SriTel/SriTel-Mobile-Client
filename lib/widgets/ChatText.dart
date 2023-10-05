import 'package:SriTel/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum ChatTextType { send, receive}

class ChatText extends StatelessWidget {
  final ChatTextType type;
  final String text;
  final DateTime dateTime;

  const ChatText({super.key, required this.type, required this.text, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: (type == ChatTextType.send) ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          constraints: const BoxConstraints(maxWidth: 246.0),
          decoration: BoxDecoration(
            color: type == ChatTextType.receive ? SriTelColor.white : SriTelColor.primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(15),
              topRight: const Radius.circular(15),
              bottomRight: type == ChatTextType.receive ? const Radius.circular(15) : const Radius.circular(0),
              bottomLeft: type == ChatTextType.receive ? const Radius.circular(0) : const Radius.circular(15),
            ),
            boxShadow: const [
              BoxShadow(
                color: SriTelColor.lightGrey,
                blurRadius: 32,
                offset: Offset(0, 8),
                spreadRadius: 0,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 16,
              right: 10,
              bottom: 8,
              left: 10,
            ),
            child: Column(
              crossAxisAlignment: type == ChatTextType.receive ? CrossAxisAlignment.start : CrossAxisAlignment.end,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    color: type == ChatTextType.receive ? SriTelColor.titleTextColor : SriTelColor.white,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  DateFormat('HH:mm a').format(dateTime).toLowerCase(),
                  style: TextStyle(
                    color: type == ChatTextType.receive ? SriTelColor.grey.withOpacity(0.75) : SriTelColor.lightWhite,
                    fontSize: 10,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
