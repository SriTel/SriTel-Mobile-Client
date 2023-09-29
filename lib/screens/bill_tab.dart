import 'package:SriTel/screens/payment_screen.dart';
import 'package:SriTel/widgets/bill_widget.dart';
import 'package:SriTel/widgets/button.dart';
import 'package:SriTel/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BillTab extends StatelessWidget {
  BillTab({super.key});

  List<BillEntry> billEntries = [
    BillEntry(title: 'Domestic Calls', charge: 150),
    BillEntry(title: 'International Calls', charge: 150)
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomCard(
              type: CardType.light,
              // child: Text('Hello'),
              child: BillWidget(
                  billEntries: billEntries,
                  taxAmount: 150
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Button(
                rightIcon: const Icon(Icons.arrow_forward_ios_rounded),
                buttonText: "Pay",
                onPressed: () => Get.to(() => PaymentScreen())),
          ],
        ),
      ),
    );
  }
}
