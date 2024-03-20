
import 'package:flutter/material.dart';
import '../../common/widgets/appbar/appbar.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';

class Notice extends StatelessWidget {
  const Notice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final darkMode = EHelperFunctions.isDarkMode(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              darkMode ? Colors.black : Colors.white,
              darkMode ? EColors.black : EColors.white,
            ],
            radius: 1.5,
          ),
        ),
        child: Scaffold(
          backgroundColor: darkMode ? Colors.black : EColors.backgroundColor ,
          appBar: const GAppBar(
            backgroundColor: Colors.transparent,
            showBackArrow: false,
            title: Text(
              'Notice',
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: darkMode ? EColors.black : EColors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: darkMode
                              ? Colors.black.withOpacity(0.2)
                              : Colors.white.withOpacity(0.6),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: Offset(-8, -8),
                        ),
                        BoxShadow(
                          color: darkMode
                              ? Colors.black.withOpacity(0.15)
                              : Colors.white.withOpacity(0.8),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: Offset(8, 8),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Notification Heading',
                            style: TextStyle(
                              color: darkMode
                                  ? EColors.textPrimaryHeading
                                  : EColors.black,
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: ESizes.spaceBtwItemsHeadings),
                          Text(
                            'Description: Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity.',
                            style: TextStyle(
                              color: darkMode
                                  ? EColors.textSecondaryTitle
                                  : EColors.black.withOpacity(0.8),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '14 Jan 2024\n11:45 AM',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: darkMode
                                      ? Colors.white.withOpacity(0.6)
                                      : Color(0xFF686868),
                                  fontSize: 8,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}







/*
import 'package:flutter/material.dart';
import '../../common/widgets/appbar/appbar.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';

class Notice extends StatelessWidget {
  const Notice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final darkMode = EHelperFunctions.isDarkMode(context);

    return Scaffold(
      backgroundColor: darkMode ? EColors.black : EColors.backgroundColor,
      /// App Bar
      appBar: const GAppBar(
        backgroundColor: Colors.transparent ,
        showBackArrow: false,
        title: Text(
          'Notice',
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [

              /// Notification Card For Text only

              Container(
                // width: 373,
                // height: 179,
                decoration: ShapeDecoration(
                  color:  darkMode ? EColors.black : EColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Colors.red.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(2, 2),
                    ),
                    const BoxShadow(
                      color: Colors.white12,
                      spreadRadius: .5,
                      blurRadius: 4,
                      offset: Offset(-2, -2),
                    ),

                  ],

                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Notification Heading',
                                    style: TextStyle(
                                      color: EColors.textPrimaryHeading,
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: ESizes.spaceBtwItemsHeadings,),
                              Text(
                                'Description: Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity.',
                                style: TextStyle(
                                  color: EColors.textSecondaryTitle,
                                  fontSize: 12,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                ),

                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        '14 Jan 2024\n11:45 AM',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFF686868),
                          fontSize: 8,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}


 */


