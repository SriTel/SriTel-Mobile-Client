import 'package:SriTel/theme/colors.dart';
import 'package:SriTel/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class QuickAccessWidget extends StatelessWidget {
  final String label;
  final Callback onTap;
  const QuickAccessWidget({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomCard(
          type: CardType.light,
          child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: 70,
                  child: Column(
                    children: [
                      SvgPicture.asset('assets/icons/${label.toLowerCase()}.svg'),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        label,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: SriTelColor.primaryColor
                        ),
                      )
                    ],
                  ),
                ),
              ))),
    );
  }
}
