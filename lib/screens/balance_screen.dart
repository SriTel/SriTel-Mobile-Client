import 'package:SriTel/controllers/balance_controller.dart';
import 'package:SriTel/theme/colors.dart';
import 'package:SriTel/widgets/balance_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BalanceScreen extends StatelessWidget {
  BalanceScreen({super.key});

  final BalanceController _balanceController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Balance'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding:  EdgeInsets.only(left: 24.0, right: 24.0, bottom: 0.0, top: 16.0),
              child: Text(
                  'Data Balance',
                style: TextStyle(
                  fontSize: 20,
                  color: SriTelColor.titleTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding:  const EdgeInsets.only(left: 16.0,right: 16.0, top: 10, bottom: 30),
                child: Obx(() => Row(
                  children: [
                    for (var balance in _balanceController.dataBalanceUsageList)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: BalanceCardWidget(
                          title: balance.title,
                          unit: balance.unit,
                          totalAmount: balance.totalAmount,
                          usage: balance.usage,
                        ),
                      ),
                  ],
                )),
              ),
            ),
            const Padding(
              padding:  EdgeInsets.only(left: 24.0, right: 24.0, bottom: 0.0, top: 0.0),
              child: Text(
                'Voice Balance',
                style: TextStyle(
                  fontSize: 20,
                  color: SriTelColor.titleTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding:  const EdgeInsets.only(left: 16.0,right: 16.0, top: 10, bottom: 30),
                child: Obx(() => Row(
                  children: [
                    for (var balance in _balanceController.voiceBalanceUsageList)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: BalanceCardWidget(
                          title: balance.title,
                          unit: balance.unit,
                          totalAmount: balance.totalAmount,
                          usage: balance.usage,
                        ),
                      ),
                  ],
                )),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
