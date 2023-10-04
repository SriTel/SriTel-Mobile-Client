import 'package:SriTel/controllers/bill_controller.dart';
import 'package:SriTel/screens/payment_screen.dart';
import 'package:SriTel/widgets/bill_widget.dart';
import 'package:SriTel/widgets/button.dart';
import 'package:SriTel/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BillTab extends StatelessWidget {
  BillTab({super.key});

  final BillController _billController = Get.find();

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
              child: Obx(
                    () => BillWidget(
                  title: 'Internet Bill',
                  billId: _billController.getBillId(BillType.data),
                  serviceId: _billController.getServiceId(BillType.data),
                  billEntries: _billController.dataBillEntries,
                  taxAmount: _billController.getTaxAmount(BillType.data),
                  dueAmount: _billController.getDueAmount(BillType.data),
                  paidAmount: _billController.getPaidAmount(BillType.data),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomCard(
              type: CardType.light,
              // child: Text('Hello'),
              child: Obx(
                    () => BillWidget(
                  title: 'Telephone Bill',
                  billId: _billController.getBillId(BillType.voice),
                  serviceId: _billController.getServiceId(BillType.voice),
                  billEntries: _billController.voiceBillEntries,
                  taxAmount: _billController.getTaxAmount(BillType.voice),
                  dueAmount: _billController.getDueAmount(BillType.voice),
                  paidAmount: _billController.getPaidAmount(BillType.voice),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
