import 'package:SriTel/controllers/service_controller.dart';
import 'package:SriTel/theme/colors.dart';
import 'package:SriTel/widgets/bottom_sheet_panel.dart';
import 'package:SriTel/widgets/button.dart';
import 'package:SriTel/widgets/card.dart';
import 'package:SriTel/widgets/custom_visibility_widget.dart';
import 'package:SriTel/widgets/toggable_widget.dart';
import 'package:SriTel/widgets/tune_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtherServicesTab extends StatefulWidget {
  const OtherServicesTab({super.key});

  @override
  State<OtherServicesTab> createState() => _OtherServicesTabState();
}

class _OtherServicesTabState extends State<OtherServicesTab> {

  final _serviceController = Get.find<ServiceController>();

  void _showBottomSheet(BuildContext context) async {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return BottomSheetPanel(onClose: changeRingingTone,);
      },
    );
  }

  void toggleDataRoaming(bool? newValue) {
    // You can perform actions based on the boolean value here
    _serviceController.toggleDataRoaming(newValue);
  }
  void toggleVoiceRoaming(bool? newValue) {
    // You can perform actions based on the boolean value here
    _serviceController.toggleVoiceRoaming(newValue);
  }
  void toggleRingingTone(bool? newValue) async {
    // You can perform actions based on the boolean value here
    await _serviceController.toggleRingingTone(newValue);
    setState(() => {});
  }

  void changeRingingTone(String newTone) async {
    await _serviceController.changeRingingTone(newTone);
    setState(() => {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: CustomCard(
            type: CardType.light,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Obx(() => ToggableWidget(
                    title: 'Data Roaming',
                    state: _serviceController.getIsDataRoaming(),
                    onPressed: toggleDataRoaming,
                  )),
                  const SizedBox(height: 10),
                  const Divider(
                    thickness: 2,
                    color: SriTelColor.lightGrey,
                  ),
                  Obx(() => ToggableWidget(
                    title: 'Voice Roaming',
                    state: _serviceController.getIsVoiceRoaming(),
                    onPressed: toggleVoiceRoaming,
                  )),
                  const SizedBox(height: 10),
                  const Divider(
                    thickness: 2,
                    color: SriTelColor.lightGrey,
                  ),
                  Obx(() => ToggableWidget(
                    title: 'Tel-Tunes',
                    state: _serviceController.getIsRingingTone(),
                    onPressed: toggleRingingTone,
                  )),
                  const SizedBox(height: 10),
                  Obx(() => CustomVisibilityWidget(
                    visibility: _serviceController.getIsRingingTone(),
                    child: Column(
                      children: [
                        Obx(() => TuneWidget(
                          tuneName: _serviceController.getRingingTone(),
                          onPressed: ()=>{},
                        )),
                        const SizedBox(height: 10),
                        Button(
                          buttonText: "Change",
                          onPressed: () => _showBottomSheet(context)
                        ),
                      ],
                    ),
                  )),
                  // Text(varia),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
