import 'package:SriTel/theme/colors.dart';
import 'package:SriTel/widgets/bottom_sheet_panel.dart';
import 'package:SriTel/widgets/button.dart';
import 'package:SriTel/widgets/card.dart';
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
  bool isActiveTunes = false;

  void _toggleTunes(){
    print("Toggled!");
    setState((){
      isActiveTunes = !isActiveTunes;
    });
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return BottomSheetPanel(
          controller: TextEditingController(), // Pass your controller here
          initiator: BottomSheetInitiatorType.fromButton, // Change as needed
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomCard(
            type: CardType.light,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ToggableWidget(
                    title: 'Roaming (Voice/Data)',
                    state: false,
                    onPressed: ()=>{},
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                    thickness: 2,
                    color: SriTelColor.lightGrey,
                  ),
                  ToggableWidget(
                    title: 'Tel-Tunes',
                    state: isActiveTunes,
                    onPressed: _toggleTunes,
                  ),
                  const SizedBox(height: 10),
                  if(isActiveTunes)
                    Column(
                      children: [
                        TuneWidget(
                          tuneName: 'Alone - Alan Walker',
                          onPressed: ()=>{},
                        ),
                        const SizedBox(height: 10),
                        Button(
                            buttonText: "Change",
                            onPressed: () => _showBottomSheet(context)),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
