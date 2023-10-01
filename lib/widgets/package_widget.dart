
import 'package:SriTel/controllers/package_controller.dart';
import 'package:SriTel/theme/colors.dart';
import 'package:SriTel/widgets/popup_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PackageWidget extends StatelessWidget {
  final int id;
  final String packageName;
  final double price;
  final String image;
  final dynamic peekData;
  final dynamic offPeekData;
  final dynamic anytimeData;
  final dynamic s2sCallMinutes;
  final dynamic anyCallMinutes;
  final dynamic s2sSMSCount;
  final dynamic anySMSCount;

  const PackageWidget({super.key,
    required this.id,
    required this.packageName,
    required this.price,
    required this.image,
    this.peekData,
    this.offPeekData,
    this.anytimeData,
    this.s2sCallMinutes,
    this.anyCallMinutes,
    this.s2sSMSCount,
    this.anySMSCount
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 296,
      height: 186,
      decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
          image: AssetImage('assets/images/packages/$image'), // Replace with your SVG file path
          fit: BoxFit.fill, // Adjust to your needs (e.g., BoxFit.fill)
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      packageName,
                      style: const TextStyle(color: SriTelColor.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    Text(
                      'Rs.${price.toInt()} + TAX',
                      style: TextStyle(color: SriTelColor.white.withOpacity(0.8),
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () => showDialog(
                    context: context,
                    builder: (BuildContext context) {

                      return PopUpDialog(
                        promptText: "You want to change?",
                        backButtonText: "No",
                        forwardButtonText: "Yes",
                        onConfirm: (){
                          Get.find<PackageController>().changePackage(id);
                          Get.back();
                        },
                      );
                    },
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: SriTelColor.white.withOpacity(0.8),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Obx(() => Row(
                      children: [
                        Text(Get.find<PackageController>().isAnActivePackage(id) ? 'Active' : 'Activate',
                          style: const TextStyle(color: SriTelColor.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Get.find<PackageController>().isAnActivePackage(id) ?
                        SvgPicture.asset('assets/images/active-eclipse.svg')
                            : SvgPicture.asset('assets/images/inactive-eclipse.svg')
                      ],
                    )),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      (peekData != null && offPeekData != null) ? 'Peek'
                          : (anytimeData != null) ? 'Any'
                          : 'S2S',
                      style: TextStyle(color: SriTelColor.white.withOpacity(0.8),
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      (peekData != null && offPeekData != null) ? peekData.toStringAsFixed(0)
                          : (anytimeData != null) ? anytimeData.toStringAsFixed(0)
                          : (s2sCallMinutes != null && anyCallMinutes != null) ? s2sCallMinutes.toString()
                          : s2sSMSCount.toString(),
                      style: TextStyle(color: SriTelColor.white,
                          fontSize: (peekData != null && offPeekData != null || anytimeData != null) ? 36 : 30,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    Text(
                      (peekData != null && offPeekData != null || anytimeData != null) ? 'GB'
                          : (s2sCallMinutes != null && anyCallMinutes != null) ? 'Min' : 'SMS',
                      style: const TextStyle(color: SriTelColor.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500
                      ),
                    )
                  ],
                ),
                const VerticalDivider(
                  color: SriTelColor.white,
                  thickness: 5,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      (peekData != null && offPeekData != null) ? 'Off'
                          : 'Any',
                      style: TextStyle(color: SriTelColor.white.withOpacity(0.8),
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      (peekData != null && offPeekData != null) ? offPeekData.toStringAsFixed(0)
                          : (s2sCallMinutes != null && anyCallMinutes != null) ? anyCallMinutes.toString()
                          : (s2sSMSCount != null && anySMSCount != null) ? anySMSCount.toString()
                          : '',
                      style: TextStyle(color: SriTelColor.white,
                          fontSize: (peekData != null && offPeekData != null || anytimeData != null) ? 36 : 30,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    Text(
                      (peekData != null && offPeekData != null) ? 'GB'
                          : (s2sCallMinutes != null && anyCallMinutes != null) ? 'Min'
                          : (s2sSMSCount != null && anySMSCount != null) ? 'SMS' : '',
                      style: const TextStyle(color: SriTelColor.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}