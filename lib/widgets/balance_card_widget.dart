import 'package:SriTel/models/usage.dart';
import 'package:SriTel/theme/colors.dart';
import 'package:SriTel/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

enum BalanceType { data, voices2s, voiceAny, addon, extraGb, smss2s, smsAny}

class BalanceCardWidget extends StatelessWidget {
  final String title;
  final UnitOfMeasure unit;
  final double totalAmount;
  final double usage;
  const BalanceCardWidget({super.key,required this.title, required this.unit, required this.totalAmount, required this.usage});
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      type: CardType.light,
      child: Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 0, left: 10, right: 10),
        child: SizedBox(
          height: 260,
          width: 220,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 20,
                    color: SriTelColor.titleTextColor,
                    fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 16,),
              CircularPercentIndicator(
                radius: 80,
                lineWidth: 13,
                percent: ((totalAmount-usage)/totalAmount),
                progressColor: unit == UnitOfMeasure.Gb ? SriTelColor.primaryColor
                    : unit == UnitOfMeasure.Minutes ? Colors.deepOrangeAccent
                    : Colors.pinkAccent,
                backgroundColor: unit == UnitOfMeasure.Gb ? SriTelColor.primaryColor.withOpacity(0.2)
                    : unit == UnitOfMeasure.Minutes ? Colors.deepOrangeAccent.withOpacity(0.2)
                    : Colors.pinkAccent.withOpacity(0.2),
                circularStrokeCap: CircularStrokeCap.round,
                center: SizedBox(
                  height: 75,
                  child:  Column(
                    children: [
                      SizedBox(
                        height: 50,
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  unit == UnitOfMeasure.Gb ? (totalAmount-usage).toStringAsFixed(1)
                                    : (totalAmount-usage).toStringAsFixed(0),
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: unit == UnitOfMeasure.Gb ? SriTelColor.primaryColor
                                        : unit == UnitOfMeasure.Minutes ? Colors.deepOrangeAccent
                                        : Colors.pinkAccent,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '/',
                              style: TextStyle(
                                  fontSize: 32,
                                  color: unit == UnitOfMeasure.Gb ? SriTelColor.primaryColor
                                      : unit == UnitOfMeasure.Minutes ? Colors.deepOrangeAccent
                                      : Colors.pinkAccent,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              unit == UnitOfMeasure.Gb ? totalAmount.toStringAsFixed(1)
                                : totalAmount.toStringAsFixed(0),
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: SriTelColor.grey,
                                  fontWeight: FontWeight.bold
                              ),
                            ),

                          ],
                        ),
                      ),
                      // SizedBox(
                      //   height: 5,
                      // ),
                      Text(
                        unit == UnitOfMeasure.Gb ? ' GB'
                        : unit == UnitOfMeasure.Minutes ? ' Min'
                        : ' SMS',
                        style: const TextStyle(
                            fontSize: 16,
                            color: SriTelColor.grey,
                            fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                  unit == UnitOfMeasure.Gb ?
                    'You have remaining data ${(totalAmount-usage).toStringAsFixed(1)} GB out of ${totalAmount.toStringAsFixed(1)} GB'
                  : unit == UnitOfMeasure.Minutes ?
                  'You have remaining data ${(totalAmount-usage).toStringAsFixed(0)} Minutes out of ${totalAmount.toStringAsFixed(0)} Minutes'
                  : 'You have remaining data ${(totalAmount-usage).toStringAsFixed(0)} SMS out of ${totalAmount.toStringAsFixed(0)} SMS',
                  textAlign: TextAlign.center
              )
            ],
          ),
        ),
      ),
    );
  }
}
