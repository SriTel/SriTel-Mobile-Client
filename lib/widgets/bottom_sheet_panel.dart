import 'dart:ui';

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
  final TextEditingController controller;
  // final BookingFilterController _bookingFilterController = Get.find();
  final BottomSheetInitiatorType initiator;
  const BottomSheetPanel({super.key, required this.controller, required this.initiator});

  @override
  State<BottomSheetPanel> createState() => _BottomSheetPanelState();
}

class _BottomSheetPanelState extends State<BottomSheetPanel> {
  // final BookingFilterController _bookingFilterController = Get.find();
  // List<Planet> _travelLocations = [];
  // filter method
  // List<Planet> filterSpaceports(String input) {
  //   final lowerCaseInput = input.toLowerCase();
  //   return _bookingFilterController.planets.where((spaceport) {
  //     final lowerCasePlanetName = spaceport.planetName.toLowerCase();
  //     final lowerCasePortName = spaceport.planetDescription.toLowerCase();
  //     // uncomment if you want to filter the spaceport as well
  //     // return lowerCasePlanetName.contains(lowerCaseInput) ||
  //     //     lowerCasePortName.contains(lowerCaseInput);
  //     return lowerCasePlanetName.contains(lowerCaseInput);
  //   }).toList();
  // }
  List<String> tunes = [
    'Alone - Alan Walkers',
    'Darkside - Alan Walker',
    'Faded - Alan Walker',
    'The Spectre - Alan Walkers',
    'Sing me to sleep - Alan Walkers',
  ];

  @override
  void initState() {
    super.initState();
    // _travelLocations = _bookingFilterController.planets;
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
                controller: widget.controller,
                onChanged: (input){
                  setState(() {
                    // _travelLocations = filterSpaceports(input);
                  });
                },
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
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
                              // Handle the item click here.
                              // _bookingFilterController.changePlanet(widget.initiator,
                              //     _bookingFilterController.planets[index]);
                              // Navigator.pop(context);
                            },
                            child: TuneWidget(
                              tuneName: tunes[index],
                              onPressed: ()=>{},
                            ),
                            // child: SpacePort(
                            //     travelLocation:
                            //     _bookingFilterController.planets[index]),
                          ),
                        ),
                        Divider(
                            color: SriTelColor.lightGrey,
                            thickness: 2,
                        ),
                      ],
                    ),
                    );
                  },
                ),
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

