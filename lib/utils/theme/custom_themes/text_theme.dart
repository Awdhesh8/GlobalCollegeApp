import 'package:flutter/material.dart';
import 'package:globalcollegeapp/utils/constants/colors.dart';

class ETextTheme{
  ETextTheme._();


  //// Light Text Theme
  static TextTheme lightTextTheme = TextTheme(

    headlineLarge: const TextStyle().copyWith(fontSize:18, fontWeight: FontWeight.bold, color: Colors.black ),
    headlineMedium: const TextStyle().copyWith(fontSize:16, fontWeight: FontWeight.w500, color: Colors.black ),
    headlineSmall: const TextStyle().copyWith(fontSize:12, fontWeight: FontWeight.w500, color: Colors.black ),

    titleLarge: const TextStyle().copyWith(fontSize:16, fontWeight: FontWeight.bold, color: Colors.black ),
    titleMedium: const TextStyle().copyWith(fontSize:16, fontWeight: FontWeight.w600, color: Colors.black ),
    titleSmall: const TextStyle().copyWith(fontSize:16, fontWeight: FontWeight.w600, color: Colors.black ),

    bodyLarge: const TextStyle().copyWith(fontSize:14, fontWeight: FontWeight.bold, color: Colors.black ),
    bodyMedium: const TextStyle().copyWith(fontSize:14, fontWeight: FontWeight.w600, color: Colors.black ),
    bodySmall: const TextStyle().copyWith(fontSize:14, fontWeight: FontWeight.w500, color: EColors.textColorPrimary1, fontFamily: 'Inter'),

    labelLarge: const TextStyle().copyWith(fontSize:12, fontWeight: FontWeight.bold, color: Colors.black ),
    labelMedium: const TextStyle().copyWith(fontSize:12, fontWeight: FontWeight.w500, color: Colors.black , fontFamily: 'Inter'),
    labelSmall: const TextStyle().copyWith(fontSize:10, fontWeight: FontWeight.w500, color: Colors.black , fontFamily: 'Inter'),
  );


  //// Dark Text Theme
  static TextTheme darkTextTheme = TextTheme(

    headlineLarge: const TextStyle().copyWith(fontSize:32, fontWeight: FontWeight.bold, color: Colors.white ),
    headlineMedium: const TextStyle().copyWith(fontSize:24, fontWeight: FontWeight.w600, color: Colors.white ),
    headlineSmall: const TextStyle().copyWith(fontSize:18, fontWeight: FontWeight.w600, color: Colors.white ),

    titleLarge: const TextStyle().copyWith(fontSize:16, fontWeight: FontWeight.bold, color: Colors.white ),
    titleMedium: const TextStyle().copyWith(fontSize:16, fontWeight: FontWeight.w600, color: Colors.white ),
    titleSmall: const TextStyle().copyWith(fontSize:16, fontWeight: FontWeight.w600, color: Colors.white ),

    bodyLarge: const TextStyle().copyWith(fontSize:14, fontWeight: FontWeight.bold, color: Colors.white ),
    bodyMedium: const TextStyle().copyWith(fontSize:14, fontWeight: FontWeight.w600, color: Colors.white ),
    bodySmall: const TextStyle().copyWith(fontSize:14, fontWeight: FontWeight.w600, color: Colors.white ),

    labelLarge: const TextStyle().copyWith(fontSize:12, fontWeight: FontWeight.bold, color: Colors.white ),
    labelMedium: const TextStyle().copyWith(fontSize:12, fontWeight: FontWeight.w600, color: Colors.white ),

  );

}