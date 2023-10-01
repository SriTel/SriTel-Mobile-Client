import 'package:SriTel/controllers/package_controller.dart';
import 'package:SriTel/models/package.dart';
import 'package:SriTel/widgets/card.dart';
import 'package:SriTel/widgets/package_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PackageTab extends StatelessWidget {
  PackageTab({super.key});
  final PackageController _packageController = Get.find();

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
            child:
            Obx(()=>Row(
              children: [
                const SizedBox(
                  width: 24,
                ),
                for (var package in _packageController.packages)
                  if(package.type == PackageType.data)
                    Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: CustomCard(
                      type: CardType.datapackage,
                      showShadow: false,
                      child: PackageWidget(
                        id: package.id,
                        packageName: package.name,
                        price: package.charge,
                        peekData: package.peekData,
                        offPeekData: package.offPeekData,
                        image: package.image,
                      ),
                    ),
                  ),
              ],
            )),
          ),
          const SizedBox(height: 10,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Voice Packages',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              ),
            ),
          ),
          const SizedBox(height: 10,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child:
            Obx(
                () => Row(
                  children: [
                    const SizedBox(
                      width: 24,
                    ),
                    for (var package in _packageController.packages)
                      if(package.type == PackageType.voice)
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: CustomCard(
                            type: CardType.voicepackage,
                            showShadow: false,
                            child: PackageWidget(
                              id: package.id,
                              packageName: package.name,
                              price: package.charge,
                              s2sCallMinutes: package.s2SCallMins,
                              anyCallMinutes: package.anyNetCallMins,
                              image: package.image,
                            ),
                          ),
                        ),
                  ],
                )
            ),
          ),
          const SizedBox(height: 10,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Learn Packages',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              ),
            ),
          ),
          const SizedBox(height: 10,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child:
            Obx(
                () => Row(
                  children: [
                    const SizedBox(
                      width: 24,
                    ),
                    for (var package in _packageController.packages)
                      if(package.type == PackageType.other)
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: CustomCard(
                            type: CardType.voicepackage,
                            showShadow: false,
                            child: PackageWidget(
                              id: package.id,
                              packageName: package.name,
                              price: package.charge,
                              s2sSMSCount: package.s2SSmsCount,
                              anySMSCount: package.anyNetSmsCount,
                              image: package.image,
                            ),
                          ),
                        ),
                  ],
                )
            ),
          ),
        ],
      ),
    );
  }
}
