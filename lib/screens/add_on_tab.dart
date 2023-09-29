import 'dart:ui';

import 'package:SriTel/models/addon.dart';
import 'package:SriTel/models/extragb.dart';
import 'package:SriTel/widgets/addon_widget.dart';
import 'package:SriTel/widgets/card.dart';
import 'package:SriTel/widgets/extragb_widget.dart';
import 'package:flutter/material.dart';

class AddOnTab extends StatelessWidget {
  AddOnTab({super.key});
  List<Addon> addons = [
    Addon(
      addonName: 'Web Starter',
      price: 1760,
      data: 40,
      image: 'cardbackground1',
    ),
    Addon(
      addonName: 'Web Starter',
      price: 1760,
      data: 40,
      image: 'cardbackground1',
    ),
    Addon(
      addonName: 'Web Starter',
      price: 1760,
      data: 40,
      image: 'cardbackground1',
    ),
  ];
  List<ExtraGB> extraGBAddons = [
    ExtraGB(
      data: 5,
      price: 100,
    ),
    ExtraGB(
      data: 6,
      price: 100,
    ),
    ExtraGB(
      data: 15,
      price: 100,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Data Packages',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16
            ),
          ),
          const SizedBox(height: 10,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (var addon in addons)
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: CustomCard(
                      type: CardType.addon,
                      showShadow: false,
                      child: AddOnWidget(
                        packageName: addon.addonName,
                        price: addon.price,
                        image: addon.image,
                        data: addon.data,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 10,),
          const Text(
            'Extra GB',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16
            ),
          ),
          const SizedBox(height: 10,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (var extragb in extraGBAddons)
                    Row(
                      children: [
                        CustomCard(
                          type: CardType.extragb1,
                          child: ExtraGBWidget(data: extragb.data, price: extragb.price, onTap: (){}),
                        ),
                        const SizedBox(
                          width: 9,
                        ),
                      ],
                    ),
                    // const SizedBox(width: 9,),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10,),
          const Text(
            'Rs.85 Per GB',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16
            ),
          ),
          const SizedBox(height: 10,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (var extragb in extraGBAddons)
                    Row(
                      children: [
                        CustomCard(
                          type: CardType.extragb2,
                          child: ExtraGBWidget(data: extragb.data, price: extragb.price, onTap: (){}),
                        ),
                        const SizedBox(
                          width: 9,
                        ),
                      ],
                    ),
                  // const SizedBox(width: 9,),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10,),
          const Text(
            'Rs.75 Per GB',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16
            ),
          ),
          const SizedBox(height: 10,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (var extragb in extraGBAddons)
                    Row(
                      children: [
                        CustomCard(
                          type: CardType.extragb3,
                          child: ExtraGBWidget(data: extragb.data, price: extragb.price, onTap: (){}),
                        ),
                        const SizedBox(
                          width: 9,
                        ),
                      ],
                    ),
                  // const SizedBox(width: 9,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ShadowedChild extends StatelessWidget {
  final Widget child;

  ShadowedChild({required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child, // The actual child widget
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.white.withOpacity(0), // Adjust the opacity as needed
              ),
            ),
          ),
        ),
      ],
    );
  }
}
