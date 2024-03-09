import 'package:flutter/material.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class VTLetter extends StatelessWidget {
  const VTLetter({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = EHelperFunctions.isDarkMode(context);

    return Scaffold(
      backgroundColor: darkMode ? Colors.black : EColors.backgroundColor ,
      appBar: const GAppBar(
        backgroundColor: Colors.transparent,
        showBackArrow: true,
        title: Text(
          'VT Letter',
          style: TextStyle(
            fontSize: ESizes.appTitle,
            fontFamily: 'Inter',
            color: EColors.primary,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: false,
      ),
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Center(child: Text('VT Letter'),)
          ],
        ),
      ),
    );
  }
}

