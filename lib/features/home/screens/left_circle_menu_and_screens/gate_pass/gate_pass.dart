import 'package:flutter/material.dart';
import 'package:globalcollegeapp/common/widgets/appbar/appbar.dart';
import '../../../../../utils/constants/colors.dart';

class GatePass extends StatelessWidget {
  const GatePass({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: EColors.backgroundColor,
      /// App Bar
      appBar: GAppBar(
        backgroundColor: Colors.transparent,
        showBackArrow: true,
        title: Text(
          'Gate Pass',
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'Inter',
            color: EColors.textColorPrimary1,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Center(child: Text('Gate Pass'),),
    );
  }
}
