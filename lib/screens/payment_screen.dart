import 'package:SriTel/controllers/payment_controller.dart';
import 'package:SriTel/widgets/button.dart';
import 'package:SriTel/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PaymentScreen extends StatelessWidget {
  final int billId;
  final int serviceId;
  final double totalPayable;
  PaymentScreen({super.key, required this.billId, required this.serviceId, required this.totalPayable});
  final PaymentController _paymentController = Get.find();
  final TextEditingController paymentAmountController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expMonthController = TextEditingController();
  final TextEditingController expYearController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bill Payment'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24.0, top: 24.0, right: 24.0),
            child: InputField(
              type: InputType.disabled,
              leadingIcon: const Icon(Icons.ac_unit),
              labelText: 'Total Payable',
              hintText: NumberFormat("#,##0.00", "en_US").format(totalPayable),
              controller: paymentAmountController,
              numberInput: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24.0, top: 24.0, right: 24.0),
            child: InputField(
              leadingIcon: const Icon(Icons.ac_unit),
              labelText: 'Pay Amount',
              controller: paymentAmountController,
              numberInput: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24.0, top: 24.0, right: 24.0),
            child: InputField(
              labelText: 'Credit/Debit Card No:',
              controller: cardNumberController,
              numberInput: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24.0, top: 24.0, right: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InputField(
                      labelText: 'Exp Month',
                      controller: expMonthController,
                      numberInput: true,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InputField(
                      labelText: 'Exp Year',
                      controller: expYearController,
                      numberInput: true,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 0.0),
                    child: InputField(
                      labelText: 'CVV',
                      controller: cvvController,
                      numberInput: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24.0, top: 24.0, right: 24.0),
            child: Button(
                rightIcon: const Icon(Icons.check_circle_outline),
                buttonText: "Pay Now",
                onPressed: (){
                  _paymentController.makePayment(
                    billId,
                    serviceId,
                    double.parse(paymentAmountController.text),
                    totalPayable,
                  );
                  Get.back();
                }),
          )
        ],
      ),
    );
  }
}
