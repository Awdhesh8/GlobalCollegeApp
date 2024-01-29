import 'package:flutter/material.dart';
import 'package:globalcollegeapp/common/widgets/appbar/appbar.dart';
import 'package:globalcollegeapp/utils/constants/colors.dart';

class FeesScreen extends StatelessWidget {
  const FeesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: EColors.backgroundColor,
        appBar: GAppBar(
          backgroundColor: Colors.transparent,
          showBackArrow: true,
          title: Text(
            'Fees',
            style: TextStyle(
                color: EColors.textColorPrimary1,
                fontWeight: FontWeight.bold
            ),
          ),
        ),


    );
  }
}