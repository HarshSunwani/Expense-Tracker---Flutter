import 'package:flutter/material.dart';

class GlobalStyles {
  // Core Colors
  static const Color themeColor = Color(0xFF2F855A);         // Rich money green
  static const Color bgColor = Color(0xFFF0FFF4);            // Pale mint background
  static const Color bottomNavIconColor = Color(0xFF68D391); // Vibrant green
  static const Color shadowColor = Color(0x1A000000);        // rgba(0,0,0,0.1)

  // Box Shadows
  static const BoxShadow boxShadow = BoxShadow(
    color: shadowColor,
    blurRadius: 50,
    spreadRadius: 10,
  );

  // Text Sizes
  static const double textSm = 10;
  static const double textMd = 15;
  static const double textLg = 20;
  static const double textXl = 25;

  // Spacing (Padding/Margin)
  static const double spaceXs = 4.0;
  static const double spaceSm = 8.0;
  static const double spaceMd = 16.0;
  static const double spaceLg = 24.0;
  static const double spaceXl = 32.0;

  // Base TextStyle
  static const TextStyle baseTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.normal,
  );

  // Text Styles
  static final TextStyle heading1 = baseTextStyle.copyWith(
    fontSize: textXl,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle heading2 = baseTextStyle.copyWith(
    fontSize: textLg,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle subtitle = baseTextStyle.copyWith(
    fontSize: textMd,
    color: Colors.black87,
  );

  static final TextStyle body = baseTextStyle.copyWith(
    fontSize: textMd,
    color: Colors.black,
  );

  static final TextStyle caption = baseTextStyle.copyWith(
    fontSize: textSm,
    color: Colors.black54,
  );
}
