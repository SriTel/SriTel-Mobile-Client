import 'package:SriTel/theme/colors.dart';
import 'package:SriTel/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopUpDialog extends StatelessWidget {
  final String promptText;
  final String backButtonText;
  final String forwardButtonText;
  final Function onConfirm;

  const PopUpDialog({
    super.key,
    required this.promptText,
    required this.backButtonText,
    required this.forwardButtonText,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 170,
        width: 250,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: const BoxDecoration(
          color: SriTelColor.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              promptText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Button(
                      buttonText: backButtonText,
                      backgroundColor: Colors.redAccent,
                      height: 45,
                      fontSize: 16,
                      onPressed: () => Get.back()),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Button(
                      buttonText: forwardButtonText,
                      height: 45,
                      fontSize: 16,
                      onPressed: () => onConfirm(),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
    return AlertDialog(
      title: Text(
          promptText,
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text(backButtonText),
        ),
        TextButton(
          onPressed: () {
            onConfirm(); // Call the callback function
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text(forwardButtonText),
        ),
      ],
    );
  }
}
