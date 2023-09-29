import 'package:SriTel/widgets/card.dart';
import 'package:SriTel/widgets/payment_history_widget.dart';
import 'package:flutter/material.dart';

class BillHistoryTab extends StatelessWidget {
  const BillHistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CustomCard(
            type: CardType.light,
            child: PaymentHistoryWidget(
              paymentAmount: 8456,
              outstanding: 8456,
              paymentType: PaymentType.card,
              dateTime: DateTime.now(),
              onPressed: ()=>{},
            ),
          ),
          const SizedBox(height: 10,),
          CustomCard(
            type: CardType.light,
            child: PaymentHistoryWidget(
              paymentAmount: 8456,
              outstanding: 8456,
              paymentType: PaymentType.bank,
              dateTime: DateTime.now(),
              onPressed: ()=>{},
            ),
          ),
          const SizedBox(height: 10,),
          CustomCard(
            type: CardType.light,
            child: PaymentHistoryWidget(
              paymentAmount: 8456,
              outstanding: 8456,
              paymentType: PaymentType.card,
              dateTime: DateTime.now(),
              onPressed: ()=>{},
            ),
          ),
        ],
      ),
    );
  }
}
