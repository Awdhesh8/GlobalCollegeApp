import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GAppBar(
        showBackArrow: false,
        title: Text(
          'Account',
          style: TextStyle(
              fontSize: ESizes.appTitle,
              color: EColors.white,
              fontWeight: FontWeight.w600),
        ),
        backgroundColor: EColors.primary,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [


          ],
        ),
      ),
    );
  }
}






