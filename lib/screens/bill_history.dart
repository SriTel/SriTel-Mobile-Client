import 'package:SriTel/controllers/payment_controller.dart';
import 'package:SriTel/widgets/card.dart';
import 'package:SriTel/widgets/payment_history_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BillHistoryTab extends StatelessWidget {
  BillHistoryTab({super.key});
  final PaymentController _paymentController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(() => ListView.builder(
        itemCount: _paymentController.payments.length, // Assuming payments is your list of Payment objects
        itemBuilder: (BuildContext context, int index) {
          final payment = _paymentController.payments[index];

          return Column(
            children: [
              CustomCard(
                type: CardType.light,
                child: PaymentHistoryWidget(
                  paymentAmount: payment.payAmount,
                  outstanding: payment.outstanding,
                  paymentType: payment.payMethod,
                  dateTime: payment.payDatetime,
                  onPressed: () => {},
                ),
              ),
              const SizedBox(height: 10),
            ],
          );
        },
      ))
    );
  }
}
