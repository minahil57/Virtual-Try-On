import 'package:flutter/material.dart';

TextStyle globalTextStyle(
        {required double fontSize,
        Color? color,
        double? letterSpacing,
        FontWeight? fontWeight,
        TextDecoration? decoration}) =>
    TextStyle(
      color: color ?? Colors.black,
      fontSize: fontSize,
      letterSpacing: letterSpacing ?? 0.5,
      fontWeight: fontWeight ?? FontWeight.w600,
      fontFamily: 'Poppins',
      decoration: decoration ?? TextDecoration.none,
    );
