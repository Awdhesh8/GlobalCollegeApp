import 'package:flutter/material.dart';

class EColors {
  EColors._();

  // App Basics Colors
  static const Color primary = Color.fromRGBO(227, 30, 36, 1);
  static const Color primarySecond = Color.fromRGBO(250, 170, 147, 1);
  static const Color secondary = Color(0xFFFFE24B);
  static const Color accent = Color(0xFFb0c7ff);
  static const Color backgroundColor = Color.fromRGBO(255, 244, 244, 1);
  static const Color circleAvatar = Color.fromRGBO(255, 235, 235, 1);
  static const Color circleCardColor = Color.fromRGBO(255, 226, 226, 1);

  // Gradient Colors
  static const Gradient linerGradient = LinearGradient(
      begin: Alignment(0.0, 0.0),
      end: Alignment(0.707, -0.707),
      colors: [
        Color(0xffff9a9e),
        Color(0xfffad0c4),
        Color(0xfffad0c4),
      ]);

  // Text Colors
  static const Color textPrimaryHeading = Color.fromRGBO(227, 30, 37, 1);
  static const Color textSecondaryTitle = Color(0xFF686868);
  static const Color textWhite = Colors.white;
  static const Color textColorPrimary = Color.fromRGBO(0, 0, 120, 1);
  // static const Color textColorPrimary1 = Color.fromRGBO(0,0,0, 1); // Black
  static const Color textColorPrimary1 = Color.fromRGBO(54, 69, 79, 1); // charcoal
  //  static const Color textColorPrimary1 = Color.fromRGBO(25,25,122, 1);  // midnight blue
  // static const Color textColorPrimary1 = Color.fromRGBO(255,255,250, 1); // White
  //  static const Color textColorPrimary1 = Color.fromRGBO(255,255,255, 1); // Ivory


  // Background Colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFF3F5FF);

  // Background Container Colors
  static const Color lightContainer = Color(0xFFF6F6F6);
  static const Color lightContainer1 = Color(0x23FABEC0);
  static Color darkContainer = EColors.textWhite.withOpacity(0.1);

  // Button Colors
  static const Color buttonPrimary = Color.fromRGBO(250, 170, 147, 1);
  static const Color buttonPrimaryOne = Color.fromRGBO(255, 71, 97, 1);
  static const Color buttonSecondary = Color(0xFF6C757D);
  static const Color buttonDisabled = Color(0xFFC4C4C4);

  // Bottom Navigation Bar
  static const Color bottomNavigationBar = Color(0xFFFFE2E2);

  // Broder Colors
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  // Error and Validation Colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  // Neutral Shades
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);

  /// Rive animation color

  static const Color backgroundColor2 = Color(0xFF17203A);
  static const Color backgroundColorLight = Color(0xFFF2F6FF);
  static const Color backgroundColorDark = Color(0xFF25254B);
  static const Color shadowColorLight = Color(0xFF4A5367);
  static const Color shadowColorDark = Colors.black;
}
