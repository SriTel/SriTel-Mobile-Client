import 'package:SriTel/controllers/addon_controller.dart';
import 'package:SriTel/theme/colors.dart';
import 'package:SriTel/widgets/popup_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExtraGBWidget extends StatelessWidget {
  final int id;
  final double dataAmount;
  final double chargePerGb;
  const ExtraGBWidget({super.key, required this.id, required this.dataAmount, required this.chargePerGb});

  @override
  Widget build(BuildContext context) {
    if(dataAmount.toInt() < 10) {
      return GestureDetector(
        onTap: () => showDialog(
          context: context,
          builder: (BuildContext context) {

            return PopUpDialog(
              promptText: "You want to add?",
              backButtonText: "No",
              forwardButtonText: "Yes",
              onConfirm: (){
                Get.find<AddOnController>().addAddOn(id);
                Get.back();
              },
            );
          },
        ),
        child: Container(
          height: 77,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dataAmount.toInt().toString(),
                  style: TextStyle(
                    color: dataAmount.toInt() <= 5
                        ? SriTelColor.primaryColor
                        : SriTelColor.white,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('GB',
                      style: TextStyle(
                          color: dataAmount.toInt() <= 5
                              ? SriTelColor.primaryColor
                              : SriTelColor.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24
                      ),),
                    Text('Rs.${(chargePerGb*dataAmount).toInt()}',
                      style: TextStyle(
                          color: dataAmount.toInt() <= 5
                              ? SriTelColor.grey
                              : SriTelColor.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 12
                      ),),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }else{
      return GestureDetector(
        onTap: () => showDialog(
          context: context,
          builder: (BuildContext context) {

            return PopUpDialog(
              promptText: "You want to add?",
              backButtonText: "No",
              forwardButtonText: "Yes",
              onConfirm: (){
                Get.find<AddOnController>().addAddOn(id);
                Get.back();
              },
            );
          },
        ),
        child: Container(
          height: 77,
          width: 111,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      dataAmount.toInt().toString(),
                      style: const TextStyle(
                        color: SriTelColor.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text('GB',
                      style: TextStyle(
                          color: SriTelColor.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24
                      ),
                    ),

                  ],
                ),
                Text('Rs.${(chargePerGb*dataAmount).toInt()}',
                  style: const TextStyle(
                      color: SriTelColor.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 12
                  ),)
              ],
            ),
          ),
        ),
      );
    }
  }
}
