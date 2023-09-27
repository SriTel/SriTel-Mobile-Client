import 'package:SriTel/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class ExtraGBWidget extends StatelessWidget {
  final double data;
  final double price;
  final Callback onTap;
  const ExtraGBWidget({super.key, required this.data, required this.price, required this.onTap});

  @override
  Widget build(BuildContext context) {
    if(data.toInt() < 10) {
      return GestureDetector(
        onTap: onTap,
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
                  data.toInt().toString(),
                  style: TextStyle(
                    color: data.toInt() <= 5
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
                          color: data.toInt() <= 5
                              ? SriTelColor.primaryColor
                              : SriTelColor.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24
                      ),),
                    Text('Rs.${price.toInt()}',
                      style: TextStyle(
                          color: data.toInt() <= 5
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
        onTap: onTap,
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
                      data.toInt().toString(),
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
                Text('Rs.${price.toInt()}',
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
