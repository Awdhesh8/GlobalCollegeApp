
import 'package:flutter/material.dart';

class CustomDeco {
  static ShapeDecoration decoRectangle() {
    return ShapeDecoration(
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(70.0),
      ),
      color: Colors.white,
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


}
