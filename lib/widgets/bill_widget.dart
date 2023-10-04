import 'package:SriTel/screens/payment_screen.dart';
import 'package:SriTel/theme/colors.dart';
import 'package:SriTel/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BillWidget extends StatelessWidget {
  final String title;
  final int billId;
  final int serviceId;
  final List<BillEntry> billEntries;
  final double taxAmount;
  final double dueAmount;
  final double paidAmount;
  const BillWidget({super.key, required this.title, required this.billId, required this.serviceId, required this.billEntries, required this.taxAmount, required this.dueAmount, required this.paidAmount});

  @override
  Widget build(BuildContext context) {

    double totalCharge = billEntries.fold(0, (double sum, BillEntry entry) {
      return sum + entry.charge;
    });
    double totalPayableAmount = totalCharge+dueAmount-paidAmount+taxAmount;
    String sumOfEntries = NumberFormat("#,##0.00", "en_US").format(totalCharge);
    String dueAmounts = NumberFormat("#,##0.00", "en_US").format(dueAmount);
    String paidAmounts = NumberFormat("#,##0.00", "en_US").format(paidAmount);
    String taxValue = NumberFormat("#,##0.00", "en_US").format(taxAmount);
    String totalPayable = NumberFormat("#,##0.00", "en_US").format(totalPayableAmount);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        children: [
          Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: SriTelColor.titleTextColor
              ),
            )
          ),
          const SizedBox(
            height: 15,
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: billEntries.length,
              itemBuilder: (context, index) {
                // Extract the details from yourList[index]
                String title = billEntries[index].title; // Replace with your data structure
                String amount = NumberFormat("#,##0.00", "en_US").format(billEntries[index].charge);
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: SriTelColor.titleTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Rs. $amount',
                    style: const TextStyle(
                      color: SriTelColor.titleTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              );
            }
          ),
          const Divider(
            color: SriTelColor.titleTextColor,
            thickness: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Rs. $sumOfEntries',
                style: const TextStyle(
                  color: SriTelColor.titleTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Value Added Tax',
                style: TextStyle(
                  color: SriTelColor.titleTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Rs. $taxValue',
                style: const TextStyle(
                  color: SriTelColor.titleTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Due Amount',
                style: TextStyle(
                  color: SriTelColor.titleTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Rs. $dueAmounts',
                style: const TextStyle(
                  color: SriTelColor.titleTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Paid Amount',
                style: TextStyle(
                  color: SriTelColor.titleTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Rs. $paidAmounts',
                style: const TextStyle(
                  color: SriTelColor.titleTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total payable',
                style: TextStyle(
                  color: SriTelColor.titleTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Rs. $totalPayable',
                style: const TextStyle(
                  color: SriTelColor.titleTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          const Divider(
            color: SriTelColor.titleTextColor,
            thickness: 2,
            height: 5,
          ),
          const Divider(
            color: SriTelColor.titleTextColor,
            thickness: 2,
            height: 5,
          ),
          const SizedBox(
            height: 20,
          ),
          Button(
              rightIcon: const Icon(Icons.arrow_forward_ios_rounded),
              buttonText: "Pay",
              onPressed: () => Get.to(() => PaymentScreen(billId: billId, serviceId: serviceId, totalPayable: totalPayableAmount), transition: Transition.rightToLeft,))
        ],
      ),
    );
  }
}

class BillEntry {
  final String title;
  final double charge;

  BillEntry({required this.title, required this.charge});
}
