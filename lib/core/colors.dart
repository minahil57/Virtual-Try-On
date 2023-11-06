import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF704538);
  static const primaryLight = Color(0xFFF9E0BB);
  static const customBlack = Color(0xFF222831);
  static const customGrey = Color(0xFF8A8686);
  static const customLightGrey = Color(0xFFD9D5D5);

  static const MaterialColor primarySwatch = MaterialColor(
    0xFF884A39,
    <int, Color>{
      50: primary,
      100: primary,
      200: primary,
      300: primary,
      400: primary,
      500: primary,
      600: primary,
      700: primary,
      800: primary,
      900: primary,
    },
  );
}
