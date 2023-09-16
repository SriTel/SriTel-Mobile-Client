import 'package:SriTel/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BillWidget extends StatelessWidget {
  final List<BillEntry> billEntries;
  final double taxAmount;
  const BillWidget({super.key, required this.billEntries, required this.taxAmount});

  @override
  Widget build(BuildContext context) {

    double totalCharge = billEntries.fold(0, (double sum, BillEntry entry) {
      return sum + entry.charge;
    });
    String sumOfEntries = NumberFormat("#,##0.00", "en_US").format(totalCharge);
    String taxValue = NumberFormat("#,##0.00", "en_US").format(taxAmount);
    String totalBill = NumberFormat("#,##0.00", "en_US").format(totalCharge+taxAmount);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        children: [
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
                'Rs. $totalBill',
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
          )
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
