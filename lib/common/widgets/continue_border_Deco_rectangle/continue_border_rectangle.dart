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

  ///
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

  ///
  static ShapeDecoration decoRectangle3() {
    return ShapeDecoration(
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
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

  ///
  static ShapeDecoration decoRectangle4() {
    return ShapeDecoration(
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(70.0),
      ),
      color: EColors.white,
      // color: Colors.red.shade50,
      // shadows: [
      //   BoxShadow(
      //     color: Colors.grey.withOpacity(0.2),
      //     spreadRadius: 1,
      //     blurRadius: 2,
      //     offset: const Offset(0, 0),
      //   ),
      // ],
    );
  }

  ///
  static ShapeDecoration decoRectangle5() {
    return ShapeDecoration(
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(70.0),
      ),
     //color: Colors.transparent,
       color: Colors.white,
       // color: Colors.red.shade50,
      //gradient: EColors.linerGradient1,
      //   (
      //   colors: [Colors.red.shade100, Colors.white], // Set your gradient colors
      //   begin: Alignment.topLeft,
      //   transform: const GradientRotation(1),
      //   tileMode: TileMode.repeated,
      //   end: Alignment.bottomRight,
      // ),
      // color: Colors.red.shade50,
      shadows: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 4,
          offset: const Offset(0, 0),
        ),
      ],
    );
  }

 ///
  static ShapeDecoration decoRectangle6() {
    return ShapeDecoration(
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(70.0),
      ),
     //color: Colors.transparent,
     //   color: EColors.primarySecond,
        color: Colors.white,
        // color: Colors.red.shade50,
      // gradient: EColors.semesterExamsGradient,
      // gradient: EColors.semesterExamsGradient,
      // gradient: EColors.linerGradient3,
      //   (
      //   colors: [Colors.red.shade100, Colors.white], // Set your gradient colors
      //   begin: Alignment.topLeft,
      //   transform: const GradientRotation(1),
      //   tileMode: TileMode.repeated,
      //   end: Alignment.bottomRight,
      // ),
      // color: Colors.red.shade50,
      shadows: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 4,
          offset: const Offset(0, 0),
        ),
      ],
    );
  }

 /// Neomorphic container
  static BoxDecoration neoDecoRectangle() {
    return BoxDecoration(
      color: EColors.backgroundColor,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.red.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 4,
          offset: const Offset(2, 2),
        ),
        const BoxShadow(
          color: Colors.white,
          spreadRadius: 2,
          blurRadius: 2,
          offset: Offset(-3, -3),
        ),
      ],
    );
  }

/// Neomorphic Icon container
  static BoxDecoration neoDecoIconRectangle() {
    return BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.redAccent.shade400,
      boxShadow: const [
        BoxShadow(
          color: Color(0xFFFFC1C5),
          offset: Offset(2, 2),
          blurRadius: 5,
          spreadRadius: 1,
        ),
        BoxShadow(
          color: Colors.white,
          offset: Offset(-3, -3),
          blurRadius: 5,
          spreadRadius: 1,
        ),
      ],
    );
  }


}
