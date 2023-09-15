import 'package:SriTel/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

enum PaymentType { card, bank }

class PaymentHistoryWidget extends StatelessWidget {
  final double paymentAmount;
  final PaymentType paymentType;
  final double outstanding;
  final DateTime dateTime;
  final Function()? onPressed;
  const PaymentHistoryWidget({super.key, required this.paymentAmount, required this.outstanding, required this.paymentType, required this.dateTime, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: SriTelColor.white,
        backgroundColor: SriTelColor.lighterWhite,
        shadowColor: SriTelColor.grey.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(0),
        elevation: 0,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text(
                      'Payment  : ',
                      style: TextStyle(
                        color: SriTelColor.titleTextColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Rs. ${NumberFormat("#,##0.00", "en_US").format(paymentAmount)}',
                      style: const TextStyle(
                        color: SriTelColor.primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                SvgPicture.asset(
                  paymentType == PaymentType.card ? 'assets/icons/visacard.svg' : 'assets/icons/bank.svg',
                  color: SriTelColor.primaryColor,
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Outstanding : Rs. ${NumberFormat("#,##0.00", "en_US").format(outstanding)}',
              style: const TextStyle(
                color: SriTelColor.grey,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  DateFormat('MM/dd/yyyy, HH:mm a').format(dateTime).toLowerCase(),
                  style: const TextStyle(
                    color: SriTelColor.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
