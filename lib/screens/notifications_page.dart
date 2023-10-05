import 'package:SriTel/screens/chat_screen.dart';
import 'package:SriTel/theme/colors.dart';
import 'package:SriTel/widgets/button.dart';
import 'package:SriTel/widgets/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 12.0, right: 12.0, bottom: 0.0, top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
              'Notifications',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: SriTelColor.titleTextColor
            ),
          ),
          const SizedBox(height: 15,),
          SingleChildScrollView(
            child: Column(
              children: [
                NotificationWidget(
                  title: 'Payment Successfull',
                  description: 'You have successfully payed the internet service bill. Check payment history to verify.',
                  dateTime: DateTime.now(),
                ),
                const SizedBox(height: 10,),
                NotificationWidget(
                  title: 'Package Expiration',
                  description: 'Your E-learning addOn has now expired. Activate a new one to continue your learning.',
                  dateTime: DateTime.now(),
                ),
                const SizedBox(height: 10,),
                NotificationWidget(
                  title: 'User Registration',
                  description: 'You have successfully registered with our telco services.',
                  dateTime: DateTime.now(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
