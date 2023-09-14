
import 'package:SriTel/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddOnWidget extends StatelessWidget {
  final String packageName;
  final double price;
  final String image;
  final dynamic data;

  const AddOnWidget({super.key,
    required this.packageName,
    required this.price,
    required this.image,
    this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 296,
      height: 186,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/$image.png'), // Replace with your SVG file path
          fit: BoxFit.cover, // Adjust to your needs (e.g., BoxFit.fill)
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
                  onTap: (){},
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: SriTelColor.white.withOpacity(0.8),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const Text('Add',
                          style: TextStyle(color: SriTelColor.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        SvgPicture.asset('assets/images/add-icon.svg')
                      ],
                    ),
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
                      'Data',
                      style: TextStyle(color: SriTelColor.white.withOpacity(0.8),
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      data.toString(),
                      style: const TextStyle(color: SriTelColor.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    const Text(
                      'GB',
                      style: TextStyle(color: SriTelColor.white,
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