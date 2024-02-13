// box_decorations.dart

import 'package:flutter/material.dart';

BoxDecoration customDecoration() {
  return BoxDecoration(
    color: const Color(0xFFFFE0E5),
    borderRadius: BorderRadius.circular(15),
    boxShadow: const [
      BoxShadow(
        color: Color(0xFFFFC1C5),
        offset: Offset(-2, -2),
        blurRadius: 5,
        spreadRadius: 2,
      ),
      BoxShadow(
        color: Colors.white,
        offset: Offset(5, 5),
        blurRadius: 5,
        spreadRadius: 2,
      ),
    ],
  );
}
