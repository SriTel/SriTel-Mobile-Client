import 'package:SriTel/theme/colors.dart';
import 'package:SriTel/widgets/addon_widget.dart';
import 'package:SriTel/widgets/bill_widget.dart';
import 'package:SriTel/widgets/extragb_widget.dart';
import 'package:SriTel/widgets/featured_package_widget.dart';
import 'package:SriTel/widgets/package_widget.dart';
import 'package:SriTel/widgets/payment_history_widget.dart';
import 'package:SriTel/widgets/quick_access_widget.dart';
import 'package:SriTel/widgets/toggable_widget.dart';
import 'package:SriTel/widgets/tune_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/card.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  @override
  Widget build(context) {

    List<BillEntry> billEntries = [
      BillEntry(title: 'Domestic Calls', charge: 150),
      BillEntry(title: 'International Calls', charge: 150)
    ];

    return Scaffold(
      // Use Obx(()=> to update Text() whenever count is changed.
      appBar: AppBar(title: const Text("Cards")),
      backgroundColor: SriTelColor.bgColor,
      // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 36.0),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomCard(
                  type: CardType.light,
                  child: Center(
                      child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Text(
                      "Light card",
                      style: TextStyle(color: SriTelColor.titleTextColor, fontSize: 16),
                    ),
                  ))),
              const SizedBox(height: 24),
              const CustomCard(
                  type: CardType.datapackage,
                  showShadow: false,
                  child: PackageWidget(
                    packageName: 'Web Starter',
                    price: 1760,
                    peekData: 40,
                    offPeekData: 60,
                    state: 1,
                    image: 'cardbackground1'
                  )),
              const SizedBox(height: 24),
              const CustomCard(
                  type: CardType.voicepackage,
                  showShadow: false,
                  child: PackageWidget(
                      packageName: 'Call Bluster',
                      price: 990,
                      s2sCallMinutes: 500,
                      anyCallMinutes: 500,
                      state: 1,
                      image: 'cardbackground2'
                  )),
              const SizedBox(height: 24),
              const CustomCard(
                type: CardType.addon,
                showShadow: false,
                child: AddOnWidget(
                    packageName: 'Zoom+Teams',
                    price: 150,
                    image: 'cardbackground3',
                    data: 30,
                ),
              ),
              const SizedBox(height: 24),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    CustomCard(
                      type: CardType.extragb1,
                      child: ExtraGBWidget(data: 1, price: 100, onTap: (){}),
                    ),
                    const SizedBox(
                      width: 9,
                    ),
                    CustomCard(
                      type: CardType.extragb2,
                      child: ExtraGBWidget(data: 6, price: 200, onTap: (){}),
                    ),
                    const SizedBox(
                      width: 9,
                    ),
                    CustomCard(
                      type: CardType.extragb3,
                      child: ExtraGBWidget(data: 10, price: 300, onTap: (){}),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  QuickAccessWidget(
                    label: 'Balance',
                    onTap: (){},
                  ),
                  QuickAccessWidget(
                    label: 'Add-On',
                    onTap: (){},
                  ),
                  QuickAccessWidget(
                    label: 'History',
                    onTap: (){},
                  ),
                ],
              ),
              const SizedBox(height: 15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FeaturedPackageWidget(
                      data: 10,
                      validDays: 7,
                      price: 69,
                      onTap: (){},
                    ),
                    const SizedBox(width: 15),
                    FeaturedPackageWidget(
                      data: 18,
                      validDays: 14,
                      price: 169,
                      type: CardType.extragb3,
                      onTap: (){},
                    ),
                    const SizedBox(width: 15),
                    FeaturedPackageWidget(
                      data: 28,
                      validDays: 14,
                      price: 259,
                      type: CardType.extragb2,
                      onTap: (){},
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
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
              const SizedBox(height: 24),
              CustomCard(
                  type: CardType.light,
                  // child: Text('Hello'),
                  child: BillWidget(
                    billEntries: billEntries,
                    taxAmount: 150
                  ),
              ),
              const SizedBox(height: 24),
              ToggableWidget(
                title: 'Roaming (Voice/Data)',
                state: false,
                onPressed: ()=>{},
              ),
              const SizedBox(height: 24),
              TuneWidget(
                tuneName: 'Alone - Alan Walker',
                onPressed: ()=>{},
              ),
            ],
          )),
        ),
      ),
    );
  }
}
