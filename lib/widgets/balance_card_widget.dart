import 'package:SriTel/theme/colors.dart';
import 'package:SriTel/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

enum BalanceType { data, voices2s, voiceAny, addon, extraGb, smss2s, smsAny}

class BalanceCardWidget extends StatelessWidget {
  final BalanceType type;
  final double totalAmount;
  final double usage;
  const BalanceCardWidget({super.key, required this.type, required this.totalAmount, required this.usage});

  String _cardTitle(){
    if(type == BalanceType.data) return "Data";
    if(type == BalanceType.addon) return "Add-On";
    if(type == BalanceType.extraGb) return "Extra-GB";
    if(type == BalanceType.smss2s) return "S2S SMS";
    if(type == BalanceType.smsAny) return "Any SMS";
    if(type == BalanceType.voices2s) return "S2S Voice Minutes";
    return "Any Voice Minutes";
  }
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      type: CardType.light,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: SizedBox(
          height: 280,
          width: 270,
          child: Column(
            children: [
              Text(
                _cardTitle(),
                style: const TextStyle(
                    fontSize: 20,
                    color: SriTelColor.titleTextColor,
                    fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 10,),
              CircularPercentIndicator(
                radius: 100,
                lineWidth: 15,
                percent: ((totalAmount-usage)/totalAmount),
                progressColor: type == BalanceType.data || type == BalanceType.addon || type == BalanceType.extraGb ? SriTelColor.primaryColor
                    : type == BalanceType.voiceAny || type == BalanceType.voices2s ? Colors.deepOrangeAccent
                    :  Colors.pinkAccent,
                backgroundColor: type == BalanceType.data || type == BalanceType.addon || type == BalanceType.extraGb ? SriTelColor.primaryColor.withOpacity(0.2)
                    : type == BalanceType.voiceAny || type == BalanceType.voices2s ? Colors.deepOrangeAccent.withOpacity(0.2)
                    :  Colors.pinkAccent.withOpacity(0.2),
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
                                  type == BalanceType.data
                                    || type == BalanceType.addon
                                    || type == BalanceType.extraGb ? (totalAmount-usage).toStringAsFixed(1)
                                    : (totalAmount-usage).toStringAsFixed(0),
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: type == BalanceType.data || type == BalanceType.addon || type == BalanceType.extraGb ? SriTelColor.primaryColor
                                        : type == BalanceType.voiceAny || type == BalanceType.voices2s ? Colors.deepOrangeAccent
                                        :  Colors.pinkAccent,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '/',
                              style: TextStyle(
                                  fontSize: 46,
                                  color: type == BalanceType.data || type == BalanceType.addon || type == BalanceType.extraGb ? SriTelColor.primaryColor
                                      : type == BalanceType.voiceAny || type == BalanceType.voices2s ? Colors.deepOrangeAccent
                                      :  Colors.pinkAccent,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              type == BalanceType.data
                                || type == BalanceType.addon
                                || type == BalanceType.extraGb ? totalAmount.toStringAsFixed(1)
                                : totalAmount.toStringAsFixed(0),
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: SriTelColor.grey,
                                  fontWeight: FontWeight.bold
                              ),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        type == BalanceType.data || type == BalanceType.addon || type == BalanceType.extraGb ? ' GB'
                        : type == BalanceType.voiceAny || type == BalanceType.voices2s ? ' Min'
                        : ' SMS',
                        style: TextStyle(
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
                height: 10,
              ),
              const Text(
                  'You have remaining data 38.5 GB out of 100 GB',
                  textAlign: TextAlign.center
              )
            ],
          ),
        ),
      ),
    );
  }
}
