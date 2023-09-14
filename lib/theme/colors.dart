import 'dart:math';

import 'package:SriTel/widgets/card.dart';
import 'package:flutter/material.dart';

class SriTelColor {
  static const Color logoColor = Color(0xFF0174FA);
  static const Color primaryColor = Color(0xFF0174FA);
  static const Color secondaryColor = Color(0xFF479BFE);
  static const Color accentColor = Color(0xFF7BB3FB);

  static const Color white = Colors.white;
  static const Color lightWhite = Color(0x77FFFFFF);
  static const Color lighterWhite = Color(0x44FFFFFF);
  static const Color black = Colors.black;
  static const Color lightBlack = Colors.black87;
  static const Color lighterBlack = Colors.black45;
  static const Color lightestBlack = Colors.black26;
  static const Color grey = Color(0xFFA8A8A8);
  static const Color lightGrey = Color(0xFFDCDCDF);
  static const Color lighterGrey = Color(0xFFF1F2F6);
  static const Color darkGrey = Color(0xFF625f6a);
  static const Color darkBlue = Color(0xFF4465A8);

  static const Color titleTextColor = Colors.black;
  static const Color subTitleTextColor = Colors.black54;
  static Color bgColor = const Color(0xFFF9F9F9);
  static Color shadowGrey = const Color(0x333E404D);
  static Color shadowGreyDark = const Color(0x463E404D);
  static Color shadowColor = SriTelColor.primaryColor.withOpacity(0.4);

  static List<Color> lightGradient = [
    SriTelColor.white,
    SriTelColor.white
  ];
  static List<Color> darkGradient = [
    SriTelColor.black.withOpacity(0.6),
    SriTelColor.black.withOpacity(0.3)
  ];
  static List<Color> primaryColorGradient = [
    SriTelColor.primaryColor.withOpacity(0.8),
    SriTelColor.primaryColor.withOpacity(0.4)
  ];
  static List<Color> borderGradient = [
    SriTelColor.white.withOpacity(0.1),
    SriTelColor.white.withOpacity(0.5),
    SriTelColor.white.withOpacity(0.1),
  ];
  static List<Color> transparentGradient = [
    SriTelColor.white.withOpacity(0),
    SriTelColor.white.withOpacity(0),
  ];

  // data package gradients
  static final List<List<Color>> _dataPackageGradients = [
    [
      const Color(0xFF407BFF),
      const Color(0xFF3972F3).withOpacity(0.74),
    ]
    // Add more gradient lists as needed
  ];
  // voice package gradients
  static final List<List<Color>> _voicePackageGradients = [
    [
      const Color(0xFFFF9C40),
      const Color(0xFFF38739).withOpacity(0.74),
    ],
    // Add more gradient lists as needed
  ];
  // voice package gradients
  static final List<List<Color>> _addOnGradients = [
    [
      const Color(0xFF7D40FF),
      const Color(0xFFE3ABF1).withOpacity(0.74),
    ],
    // Add more gradient lists as needed
  ];

  static List<Color> getRandomGradient(CardType type) {
    final random = Random();
    final int randomIndex;
    switch (type) {
      case CardType.datapackage:
        randomIndex = random.nextInt(_dataPackageGradients.length);
        return _dataPackageGradients[randomIndex];
      case CardType.voicepackage:
        randomIndex = random.nextInt(_dataPackageGradients.length);
        return _voicePackageGradients[randomIndex];
      case CardType.addon:
        randomIndex = random.nextInt(_addOnGradients.length);
        return _addOnGradients[randomIndex];
      case CardType.extragb1:
        return lightGradient;
      case CardType.extragb2:
        return [
          const Color(0xFF598AF8),
          const Color(0xFFA5C2FF),
          // const Color(0xFF628CEB).withOpacity(0.3),
        ];
      case CardType.extragb3:
        return [
          const Color(0xFFF87659),
          const Color(0xFFFFD5C0),
          // const Color(0xFFEBAC62).withOpacity(0.3),
        ];
      default:
        randomIndex = random.nextInt(_dataPackageGradients.length);
        return _dataPackageGradients[randomIndex];
    }


  }
}
