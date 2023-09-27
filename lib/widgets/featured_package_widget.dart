import 'package:SriTel/theme/colors.dart';
import 'package:SriTel/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class FeaturedPackageWidget extends StatelessWidget {
  final CardType type;
  final double data;
  final int validDays;
  final double price;
  final Callback onTap;
  const FeaturedPackageWidget({super.key, this.type = CardType.addon, required this.data, required this.validDays, required this.price, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      type: type,
      showShadow: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  data.toStringAsFixed(0),
                  style: const TextStyle(
                    color: SriTelColor.white,
                    fontSize: 48,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'GB',
                  style: TextStyle(
                    color: SriTelColor.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Text('$validDays Days',
              style: TextStyle(
                  color: SriTelColor.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold
              ),),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('Only Rs.${price.toStringAsFixed(0)}',
                style: TextStyle(
                  color: SriTelColor.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold
                ),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
