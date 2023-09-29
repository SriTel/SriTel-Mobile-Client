import 'package:SriTel/theme/colors.dart';
import 'package:SriTel/widgets/balance_card_widget.dart';
import 'package:flutter/material.dart';

class BalanceScreen extends StatelessWidget {
  const BalanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Balance'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 0.0, top: 16.0),
              child: Text(
                  'Data Balance',
                style: TextStyle(
                  fontSize: 20,
                  color: SriTelColor.titleTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0,right: 16.0, top: 10, bottom: 30),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: BalanceCardWidget(
                        type: BalanceType.data,
                        totalAmount: 100,
                        usage: 60,
                      ),
                    ),Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: BalanceCardWidget(
                        type: BalanceType.addon,
                        totalAmount: 30,
                        usage: 22,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: BalanceCardWidget(
                        type: BalanceType.extraGb,
                        totalAmount: 20,
                        usage: 8.7,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 0.0, top: 16.0),
              child: Text(
                'Voice Balance',
                style: TextStyle(
                  fontSize: 20,
                  color: SriTelColor.titleTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0,right: 16.0, top: 10, bottom: 30),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: BalanceCardWidget(
                        type: BalanceType.voices2s,
                        totalAmount: 1000,
                        usage: 647,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: BalanceCardWidget(
                        type: BalanceType.voiceAny,
                        totalAmount: 1000,
                        usage: 426,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 0.0, top: 16.0),
              child: Text(
                'SMS Balance',
                style: TextStyle(
                  fontSize: 20,
                  color: SriTelColor.titleTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0,right: 16.0, top: 10, bottom: 30),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: BalanceCardWidget(
                        type: BalanceType.smss2s,
                        totalAmount: 500,
                        usage: 420,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: BalanceCardWidget(
                        type: BalanceType.smsAny,
                        totalAmount: 500,
                        usage: 60,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
