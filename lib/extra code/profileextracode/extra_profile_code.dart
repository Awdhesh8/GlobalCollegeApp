/*
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/list_tile/settings_menu_tile.dart';
import '../../../../common/widgets/list_tile/user_profile_tile.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';



class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //       // --- Header ---
      //       EPrimaryHeaderContainer(
      //         child: Column(
      //         children: [
      //           GAppBar(title: Text('Profile Details', style: Theme.of(context).textTheme.headlineMedium!.apply(color: EColors.white),),),
      //        const SizedBox(height: ESizes.spaceBtwItems,),
      body: ProfileScreenTest()

      // SingleChildScrollView(
      //   child: Column(
      //     children: [
      //
      //       // --- Header ---
      //       EPrimaryHeaderContainer(
      //         child: Column(
      //         children: [
      //           GAppBar(title: Text('Profile Details', style: Theme.of(context).textTheme.headlineMedium!.apply(color: EColors.white),),),
      //        const SizedBox(height: ESizes.spaceBtwItems,),
      //
      //           // User Profile Card
      //           const EUserProfileTile(
      //             // onPressed: () => Get.to(() => const ProfileScreen()),
      //           ),
      //           const SizedBox(height: ESizes.spaceBtwSections,),
      //
      //         ],
      //       ),
      //       ),
      //
      //       // Body ---
      //       Padding(padding: const EdgeInsets.all(ESizes.defaultSpace),
      //       child: Column(
      //         children: [
      //
      //           // --- Account Settings ---
      //            const ESectionHeading(title: 'Personal Details', showActionButton: false,),
      //            const SizedBox(height: ESizes.spaceBtwItems,),
      //
      //           const ESettingsMenuTile(icon: Iconsax.clipboard_text, title: 'G No', subTitle: 'G/2023/POLY/CS/56',
      //             // onTap: () => Get.to(() => const UserAddressScreen()),
      //           ),
      //           ESettingsMenuTile(icon: Iconsax.clipboard_text, title: 'Enrollment No', subTitle: '2023CS45PO565', onTap: () {},),
      //           ESettingsMenuTile(icon: Iconsax.profile_2user, title: 'Father Name', subTitle: 'Your Father Name', onTap: () {},),
      //           ESettingsMenuTile(icon: Iconsax.profile_2user, title: 'Mothers Name', subTitle: 'Your Mother Name', onTap: () {},),
      //           ESettingsMenuTile(icon: Iconsax.cake, title: 'Date Of Birth', subTitle: '01/01/2024', onTap: () {},),
      //           ESettingsMenuTile(icon: Iconsax.call, title: 'Contact Number', subTitle: '+91 9998887770', onTap: () {},),
      //           ESettingsMenuTile(icon: Iconsax.call_calling, title: 'Parent Contact', subTitle: '+91 9898987744', onTap: () {},),
      //           ESettingsMenuTile(icon: Iconsax.book_1, title: 'Course', subTitle: 'Polytechnic Diploma', onTap: () {},),
      //           ESettingsMenuTile(icon: Iconsax.hierarchy_2, title: 'Branch', subTitle: 'Computer Science', onTap: () {},),
      //           ESettingsMenuTile(icon: Iconsax.card, title: 'Email', subTitle: '482001, Jabalpur,Madhya Pradesh', onTap: () {},),
      //           ESettingsMenuTile(icon: Iconsax.location, title: 'Address', subTitle: '482001, Jabalpur,Madhya Pradesh', onTap: () {},),
      //           ESettingsMenuTile(icon: Iconsax.location, title: 'Address', subTitle: '482001, Jabalpur,Madhya Pradesh', onTap: () {},),
      //           ESettingsMenuTile(icon: Iconsax.location, title: 'Address', subTitle: '482001, Jabalpur,Madhya Pradesh', onTap: () {},),
      //           ESettingsMenuTile(icon: Iconsax.location, title: 'Address', subTitle: '482001, Jabalpur,Madhya Pradesh', onTap: () {},),
      //
      //
      //           // -- App Settings ---
      //           const SizedBox(height: ESizes.spaceBtwSections,),
      //           const ESectionHeading(title: 'App Settings', showActionButton: false,),
      //           const SizedBox(height: ESizes.spaceBtwItems,),
      //           const ESettingsMenuTile(icon: Iconsax.document_upload, title: 'Load Data', subTitle: 'Upload Data to your Cloud Firebase'),
      //
      //           // Switch's --
      //           ESettingsMenuTile(icon: Iconsax.location, title: 'Geolocation', subTitle: 'Set recommendation based on location',trailing: Switch(value: true, onChanged: (value){},),),
      //           ESettingsMenuTile(icon: Iconsax.security_user, title: 'Safe Mode', subTitle: 'Search result is safe for all ages',trailing: Switch(value: false, onChanged: (value){},),),
      //           ESettingsMenuTile(icon: Iconsax.image, title: 'HD Image Quality', subTitle: 'Set image quality to be seen',trailing: Switch(value: false, onChanged: (value){},),),
      //
      //
      //         // --- Logout Button ---
      //           const SizedBox(height: ESizes.spaceBtwSections,),
      //           SizedBox(
      //             width: double.infinity,
      //             child: OutlinedButton(onPressed: (){},child: const Text('Logout'),),
      //           ),
      //           const SizedBox(height: ESizes.spaceBtwSections * 2.5,),
      //         ],
      //       ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}



class ProfileScreenTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GAppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/user_image.png'), // Replace with user image
              radius: 20,
            ),
            SizedBox(width: 10),
            Text(
              'John Doe', // Replace with user's name
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        showBackArrow: false, // Or set as needed
        backgroundColor: Colors.blue, // Change color as needed
        bottom: TabBar(
          tabs: [
            Tab(text: 'Profile'),
            Tab(text: 'Educational Details'),
          ],
        ),
      ),
      body: TabBarView(
        children: [
          ProfileDetailsTab(),
          EducationalDetailsTab(),
        ],
      ),
    );
  }
}

class ProfileDetailsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Add profile details here
          Text('Profile Details'),
        ],
      ),
    );
  }
}

class EducationalDetailsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Add educational details here
          Text('Educational Details'),
        ],
      ),
    );
  }
}


*/



// import 'package:flutter/material.dart';
// import 'package:globalcollegeapp/common/widgets/custom_shapes/containers/primary_header_container.dart';
// import '../../../../common/widgets/appbar/appbar.dart';
// import '../../../../common/widgets/appbar/tabbar.dart';
// import '../../../../utils/constants/colors.dart';
// import '../../../../utils/constants/sizes.dart';
// import '../../../../utils/helpers/helper_functions.dart';
//
// class SettingsScreen extends StatelessWidget {
//   const SettingsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         body: NestedScrollView(
//           headerSliverBuilder: (_, innerBoxScrolled) {
//             return [
//               SliverAppBar(
//                 automaticallyImplyLeading: false,
//                 pinned: true,
//                 floating: true,
//                 backgroundColor: EHelperFunctions.isDarkMode(context)
//                     ? EColors.black
//                     : EColors.white,
//                 expandedHeight: 240,
//                 flexibleSpace: ListView(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   children: [
//
//                     // --- Header ---
//                     EPrimaryHeaderContainer(
//                       child: Column(
//                         children: [
//                           GAppBar(
//                             title: Text(
//                               'Profile Details',
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .headlineMedium!
//                                   .apply(color: EColors.white),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: ESizes.spaceBtwItems,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//
//                 // Tabs --- >
//                 bottom: const ETabBar(
//                   tabs: [
//                     Tab(
//                       child: Text('Personal Details'),
//                     ),
//                     Tab(
//                       child: Text('Educational Details'),
//                     ),
//                   ],
//                 ),
//               ),
//             ];
//
//             // --- Body ---
//           },
//           body: const TabBarView(
//             children: [
//               ProfileDetailsTab(),
//               EducationalDetailsTab(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class ProfileDetailsTab extends StatelessWidget {
//   const ProfileDetailsTab({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const SingleChildScrollView(
//       padding: EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           // Add profile details here
//           Text('Profile Details'),
//         ],
//       ),
//     );
//   }
// }
//
// class EducationalDetailsTab extends StatelessWidget {
//   const EducationalDetailsTab({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const SingleChildScrollView(
//       padding: EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           // Add educational details here
//           Text('Educational Details'),
//         ],
//       ),
//     );
//   }
// }

/*

import 'package:flutter/material.dart';
import '../../../../common/widgets/appbar/appbar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ProfileScreenTest(),
    );
  }
}

class ProfileScreenTest extends StatefulWidget {
  const ProfileScreenTest({super.key});

  @override
  _ProfileScreenTestState createState() => _ProfileScreenTestState();
}

class _ProfileScreenTestState extends State<ProfileScreenTest>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GAppBar(
        title: const Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/user_image.png'), // Replace with user image
              radius: 20,
            ),
            SizedBox(width: 10),
            Text(
              'John Doe', // Replace with user's name
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        showBackArrow: false,
        backgroundColor: Colors.blue,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Profile'),
            Tab(text: 'Educational Details'),
          ],
          onTap: (index) {
            _tabController.animateTo(index);
          },
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ProfileDetailsTab(),
          EducationalDetailsTab(),
        ],
      ),
    );
  }
}

class ProfileDetailsTab extends StatelessWidget {
  const ProfileDetailsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Profile Details'),
          // Add profile details here
        ],
      ),
    );
  }
}

class EducationalDetailsTab extends StatelessWidget {
  const EducationalDetailsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Educational Details'),
          // Add educational details here
        ],
      ),
    );
  }
}

*/
