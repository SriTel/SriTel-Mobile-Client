import 'dart:ui';

import 'package:SriTel/controllers/service_controller.dart';
import 'package:SriTel/models/planet.dart';
import 'package:SriTel/theme/colors.dart';
import 'package:SriTel/theme/fonts.dart';
import 'package:SriTel/widgets/button.dart';
import 'package:SriTel/widgets/input_field.dart';
import 'package:SriTel/widgets/tune_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum BottomSheetInitiatorType {fromButton, toButton, departureTime, arrivalTime}

class BottomSheetPanel extends StatefulWidget {
  final Function(String) onClose;
  const BottomSheetPanel({super.key, this.onClose = _defaultOnClose});

  // Define a default constant function
  static void _defaultOnClose(String tone) {
  }

  @override
  State<BottomSheetPanel> createState() => _BottomSheetPanelState();
}

class _BottomSheetPanelState extends State<BottomSheetPanel> {

  final TextEditingController searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 0.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // search box
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: SriTelColor.grey,
                  ),
                  height: 7,
                  width: 40,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              InputField(
                type: InputType.noTitle,
                labelText: 'Search Tunes ...',
                controller: searchTextController,
                onChanged: (input){
                  setState(() {
                    Get.find<ServiceController>().updateSongVisibility(input);
                  });
                },
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Obx(() => ListView.builder(
                  itemCount: Get.find<ServiceController>().tunes.length,
                  itemBuilder: (context, index) {
                    return Visibility(
                      visible: true,
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all<double?>(0),
                                backgroundColor: MaterialStateProperty.all<
                                    Color>(
                                    SriTelColor.white),
                              ),
                              onPressed: () {
                                final serviceController = Get.find<ServiceController>();
                                serviceController.changeRingingTone(serviceController.tunes[index].song);
                              },
                              child: TuneWidget(
                                tuneName: Get.find<ServiceController>().tunes[index].song,
                                onPressed: () {
                                  widget.onClose(Get.find<ServiceController>().tunes[index].song);
                                  // final serviceController = Get.find<ServiceController>();
                                  // serviceController.changeRingingTone(serviceController.tunes[index].song);
                                  Get.back();
                                },
                              ),
                            ),
                          ),
                          const Divider(
                            color: SriTelColor.lightGrey,
                            thickness: 2,
                          ),
                        ],
                      ),
                    );
                  },
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SpacePort extends StatelessWidget {
  final Planet travelLocation;
  const SpacePort({super.key,required this.travelLocation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // image of the planet
          Image.asset(
            'assets/images/planets/${travelLocation.planetName.toLowerCase()}.png',
            width: 64,
            height: 64,
          ),
          const SizedBox(width: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(travelLocation.planetName,
                  style: const TextStyle(
                      fontFamily: SriTelFont.fontFamily,
                      color: SriTelColor.titleTextColor,
                      fontSize: 16)),
              Text(travelLocation.planetDescription,
                  style: const TextStyle(
                      fontFamily: SriTelFont.fontFamily,
                      color: SriTelColor.primaryColor)),
              const SizedBox(height: 8),
            ],
          ),
        ],
      ),
    );
  }
}

