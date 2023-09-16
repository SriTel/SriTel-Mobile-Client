import 'package:SriTel/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TuneWidget extends StatelessWidget {
  final String tuneName;
  final Function()? onPressed;
  const TuneWidget({super.key,
    required this.tuneName,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        padding: const EdgeInsets.all(0),
        elevation: 0,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/icons/music.svg',
              color: SriTelColor.primaryColor,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              tuneName,
              style: const TextStyle(
                color: SriTelColor.grey,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            )
          ],
        ),
      ),
    );
  }
}
