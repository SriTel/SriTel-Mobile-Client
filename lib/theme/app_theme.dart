import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    // set global font
    fontFamily: 'Open Sans',
    colorScheme: ColorScheme.fromSeed(
      seedColor: SriTelColor.secondaryColor,
      primary: SriTelColor.primaryColor,
    ),
    primaryColor: SriTelColor.primaryColor,
    primaryColorDark: SriTelColor.primaryColor,
    primaryColorLight: SriTelColor.secondaryColor,
    dividerColor: SriTelColor.lightGrey,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: SriTelColor.primaryColor,
      selectionColor: SriTelColor.secondaryColor,
      selectionHandleColor: SriTelColor.secondaryColor,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: const AppBarTheme(
      backgroundColor: SriTelColor.white,
      foregroundColor: SriTelColor.titleTextColor,
      elevation: 0,
      shadowColor: Colors.transparent,
      toolbarHeight: 80,
    ),
    // brightness: Brightness.dark,
    // Other Colors
    splashColor: SriTelColor.primaryColor.withAlpha(50),
    indicatorColor: SriTelColor.lightGrey,
    highlightColor: SriTelColor.lightGrey,
    scaffoldBackgroundColor: SriTelColor.bgColor
  );
}
