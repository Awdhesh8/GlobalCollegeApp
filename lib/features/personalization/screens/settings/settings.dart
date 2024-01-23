// import 'package:flutter/material.dart';
//
// import '../../../../common/widgets/appbar/appbar.dart';
// import '../../../../utils/constants/colors.dart';
// import '../../../../utils/constants/sizes.dart';
//
// class SettingsScreen extends StatelessWidget {
//   const SettingsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       appBar: GAppBar(
//         showBackArrow: false,
//         title: Text(
//           'Account',
//           style: TextStyle(
//               fontSize: ESizes.appTitle,
//               color: EColors.white,
//               fontWeight: FontWeight.w600),
//         ),
//         backgroundColor: EColors.primary,
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//
//
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:globalcollegeapp/common/widgets/texts/top_first_heading.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';


//
// class SettingsScreen extends StatelessWidget {
//   const SettingsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const GAppBar(
//         showBackArrow: false,
//         title: Text(
//           'Account',
//           style: TextStyle(
//               fontSize: ESizes.appTitle,
//               color: EColors.white,
//               fontWeight: FontWeight.w600),
//         ),
//         backgroundColor: EColors.primary,
//         centerTitle: true,
//       ),
//
//       // Body ---
//       body: Column(
//         children: [
//           Expanded(child: TimetableScreen()),
//         ],
//       )
//     );
//   }
// }

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EColors.backgroundColor, // Replace with your preferred background color
      /// App bar
      appBar: const GAppBar(
        showBackArrow: false,
        title: Text(
          'Account',
          style: TextStyle(
            fontSize: 20.0, // Adjust the font size as needed
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: EColors.primary, // Replace with your preferred app bar color
        centerTitle: true,
      ),

      /// Body contents.
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Column(
            children: [

              /// Hello, User Text Here
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                child: Row(
                  children: [
                    TopHeading(text: 'Hello,',
                      fontSize: 20,
                    ),
                    Text(' Surya Pratap Singh', style: TextStyle(fontSize: 16),)
                  ],
                ),
              ),

              /// User Image
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10,),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius:BorderRadius.circular(100),
                      child: Image.asset(
                        EImages.userIcon,
                        fit: BoxFit.cover,
                        width: 80,
                        height: 80,
                      ),
                    ),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}



