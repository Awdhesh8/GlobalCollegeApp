import 'package:flutter/material.dart';
import 'package:globalcollegeapp/common/widgets/texts/top_first_heading.dart';
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Column(
            children: [

              /// Top heading
              const TopHeading(text: 'Ignite Your Journey\nwith Vocational Excellence!',),
              RichText(
                text: const TextSpan(
                  text: 'Ignite Your Journey ',
                  children: [
                    TextSpan(text: ' world!'),
                    TextSpan(text: 'bold', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ' world!'),

                  ],
                ),
              ),
              const Text(
                'Ignite Your Journey',
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Inter',
                  color: EColors.textSecondaryTitle,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

