import 'dart:ui';

import 'package:SriTel/controllers/addon_controller.dart';
import 'package:SriTel/models/addon.dart';
import 'package:SriTel/models/extragb.dart';
import 'package:SriTel/widgets/addon_widget.dart';
import 'package:SriTel/widgets/card.dart';
import 'package:SriTel/widgets/extragb_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddOnTab extends StatelessWidget {
  AddOnTab({super.key});

  final AddOnController _addOnController = Get.find();
  List<Addon> addons = [
    Addon(
      id: 1,
      name: "1",
      type: AddOnType.extraGb,
      image: "",
      description: "",
      validNoOfDays: 30,
      chargePerGb: 100,
      dataAmount: 1
    ),
    Addon(
        id: 8,
        name: "YouTube",
        type: AddOnType.other,
        image: "youtube.png",
        description: "Unlock YouTube's Best",
        validNoOfDays: 30,
        chargePerGb: 15,
        dataAmount: 30
    ),
    Addon(
        id: 4,
        name: "6",
        type: AddOnType.extraGb,
        image: "",
        description: "",
        validNoOfDays: 60,
        chargePerGb: 85,
        dataAmount: 6
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Data Packages',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              ),
            ),
          ),
          const SizedBox(height: 10,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(
                  width: 24,
                ),
                for (var addon in _addOnController.addOns)
                  if(addon.type == AddOnType.other)
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: CustomCard(
                        type: CardType.addon,
                        showShadow: false,
                        child: AddOnWidget(
                          id: addon.id,
                          name: addon.name,
                          chargePerGb: addon.chargePerGb,
                          image: addon.image,
                          dataAmount: addon.dataAmount,
                        ),
                      ),
                    ),
              ],
            ),
          ),
          const SizedBox(height: 10,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Extra GB',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              ),
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
                  const SizedBox(
                    width: 24,
                  ),
                  for (var extraGb in _addOnController.addOns)
                    if(extraGb.type == AddOnType.extraGb && extraGb.chargePerGb > 85.0)
                      Row(
                      children: [
                        CustomCard(
                          type: CardType.extragb1,
                          child: ExtraGBWidget(
                            id: extraGb.id,
                            dataAmount: extraGb.dataAmount,
                            chargePerGb: extraGb.chargePerGb,
                          ),
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Rs.85 Per GB',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              ),
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
                  const SizedBox(
                    width: 24,
                  ),
                  for (var extraGb in _addOnController.addOns)
                    if(extraGb.type == AddOnType.extraGb && extraGb.chargePerGb > 75.0 && extraGb.chargePerGb < 100.0)
                      Row(
                      children: [
                        CustomCard(
                          type: CardType.extragb2,
                          child: ExtraGBWidget(
                            id: extraGb.id,
                            dataAmount: extraGb.dataAmount,
                            chargePerGb: extraGb.chargePerGb,
                          ),
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Rs.75 Per GB',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              ),
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
                  const SizedBox(
                    width: 24,
                  ),
                  for (var extraGb in _addOnController.addOns)
                    if(extraGb.type == AddOnType.extraGb && extraGb.chargePerGb <= 75.0)
                      Row(
                      children: [
                        CustomCard(
                          type: CardType.extragb3,
                          child: ExtraGBWidget(
                            id: extraGb.id,
                            dataAmount: extraGb.dataAmount,
                            chargePerGb: extraGb.chargePerGb,
                          ),
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

// class ShadowedChild extends StatelessWidget {
//   final Widget child;
//
//   ShadowedChild({required this.child});
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         child, // The actual child widget
//         Positioned.fill(
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(12),
//             child: BackdropFilter(
//               filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
//               child: Container(
//                 color: Colors.white.withOpacity(0), // Adjust the opacity as needed
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
