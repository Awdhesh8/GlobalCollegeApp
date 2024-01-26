import 'package:flutter/material.dart';
import 'package:globalcollegeapp/common/widgets/appbar/appbar.dart';
import 'package:globalcollegeapp/utils/constants/colors.dart';

class DefaultScreen extends StatelessWidget {
  const DefaultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: EColors.backgroundColor,
      appBar: GAppBar(
        backgroundColor: Colors.transparent,
        title: Text('Coming Soon...', style: TextStyle(
          color: EColors.primary,
          fontWeight: FontWeight.bold
        ),),
        showBackArrow: true,
      ),
      body: Center(
        child: Text('Coming Soon...'),
      ),
    );
  }
}
