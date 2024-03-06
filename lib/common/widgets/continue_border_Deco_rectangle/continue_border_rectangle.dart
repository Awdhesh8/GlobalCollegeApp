
import 'package:flutter/material.dart';
import 'package:globalcollegeapp/utils/constants/colors.dart';

class CustomDeco {

  /// continuous Rectangle Border (Container)
  static ShapeDecoration decoRectangle() {
    return ShapeDecoration(
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(70.0),
      ),
      // gradient: LinearGradient(
      //   colors: [Colors.red.shade50, Colors.white], // Set your gradient colors
      //   begin: Alignment.topLeft,
      //   end: Alignment.bottomRight,
      // ),
      color: EColors.white, // Set color to transparent to make gradient visible
      shadows: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
    );
  }

  static ShapeDecoration decoRectangle2() {
    return ShapeDecoration(
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(70.0),
      ),
      color: EColors.white, // Set color to transparent to make gradient visible
      shadows: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 2,
          offset: const Offset(0, 0),
        ),
      ],
    );
  }


}
