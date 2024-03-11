import 'package:flutter/material.dart';
import 'package:globalcollegeapp/features/home/screens/right_circle_menu_and_screens/vt_letter/widgets/vt_letter_form.dart';
import 'package:globalcollegeapp/utils/constants/teext_styles.dart';
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
      backgroundColor: darkMode ? Colors.black : EColors.backgroundColor,

      /// App Bar
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

      /// Body
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Column(
            children: [
              /// Top heading
              Row(
                children: [
                  RichText(
                    text: const TextSpan(
                      text: 'Ignite Your Journey',
                      style: CustomTextStyle.heading24,
                      children: [
                        TextSpan(text: ' with '),
                        TextSpan(
                          text: '\nVocational Excellence!',
                          style: CustomTextStyle.heading22,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: ESizes.spaceBtwSections),

              /// VT Letter Form
              VTLetterForm(),
              const SizedBox(height: ESizes.spaceBtwSections),
              const Divider(),

              /// history heading
              Row(
                children: [
                  RichText(
                    text: const TextSpan(
                      text: 'Check Your History Status',
                      style: CustomTextStyle.inputText1,
                      children: [
                        TextSpan(text: ' of '),
                        TextSpan(
                          text: '\nVocational Training',
                          style: CustomTextStyle.heading22,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
