import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';

class CustomContainerButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onTap;

  const CustomContainerButton({
    Key? key,
    required this.buttonText,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        width: 110,
        height: 52,
        decoration: BoxDecoration(
          color: EColors.primarySecond,
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: Colors.white, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Adjust opacity and color as needed
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 2), // Adjust the position of the shadow
            ),
          ],
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            buttonText,
            style: const TextStyle(
              color: EColors.textColorPrimary1,
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

