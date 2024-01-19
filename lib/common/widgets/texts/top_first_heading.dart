import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class TopHeading extends StatelessWidget {
  const TopHeading({
    Key? key, // Fix: Add the 'key' parameter
    required this.text, // Fix: Add the required parameter 'text'
  }) : super(key: key);

  final String text; // Fix: Specify the type of 'text'

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          child: Text(
            text, // Fix: Use the 'text' parameter
            style: const TextStyle(
              fontSize: ESizes.fontSizeXl,
              fontWeight: FontWeight.w600,
              color: EColors.textSecondaryTitle,
            ),
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
      ],
    );
  }
}
