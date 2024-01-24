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
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:globalcollegeapp/common/widgets/texts/top_first_heading.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/list_tile/settings_menu_tile.dart';
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

class SettingsController extends GetxController {
  RxList<bool> isExpandedList = RxList<bool>();

  @override
  void onInit() {
    super.onInit();
    // Initialize isExpandedList with false for each item
    isExpandedList.assignAll(List.generate(educationalDetails.length, (index) => false));
  }

  void toggleExpansion(int panelIndex, bool isExpanded) {
    isExpandedList[panelIndex] = !isExpanded;
    update(); // Trigger UI update
  }
}

class SettingsScreen extends StatelessWidget {
  final SettingsController controller = Get.put(SettingsController());

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EColors.backgroundColor,
      appBar: const GAppBar(
        showBackArrow: false,
        title: Text(
          'Account',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: EColors.primary,
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: 2, // Number of tabs
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: Row(
                children: [
                  TopHeading(
                    text: 'Hello,',
                    fontSize: 20,
                  ),
                  Text(' Surya Pratap Singh', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
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
            // Add the TabBar here
            const TabBar(
              tabs: [
                Tab(text: 'Profile Details'),
                Tab(text: 'Educational Details'),
              ],
            ),
            // Add the TabBarView here
            Expanded(
              child: TabBarView(
                children: [
                  UserDetails(data: personalDetails),
                  GetBuilder<SettingsController>(
                    builder: (_) => EducationDetailsPanel(
                      educationalDetails: educationalDetails,
                      isExpandedList: controller.isExpandedList,
                      onExpansionChanged: (index, isExpanded) =>
                          controller.toggleExpansion(index, isExpanded),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class UserDetails extends StatelessWidget {
  final Map<String, String> data;

  const UserDetails({Key? key, required this.data, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: data.entries.map((entry) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: ESettingsMenuTile(
              title: entry.key,
              subTitle: entry.value,
              onTap: () {
                // Add any onTap functionality here if needed
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}

Map<String, String> personalDetails = {
  'Gn No': 'G/2023/Engg/CS56',
  'Enrollment Number': '121CS12024',
  'Father’s Name': 'Jon Wick Jones',
  'Mother’s Name': 'Jon Wick Jones',
  'Date of Birth': 'Jan 01 2024',
  'Contact No': '9898987777',
  'Course': 'Engg',
  'Branch': 'CS',
  'Address': 'Jabalpur, M.P. 482001',
  'Parent Contact': '7979797777',
  'Email': 'google@gmail.com',
  'Category': 'General',
  'Blood Group': 'A+',
  'Aadhaar No': '1245 6789 1234 5678',
  'Samarga Id': '121JBP456',
  'Laptop': 'YES',
};

class EducationDetailsPanel extends StatelessWidget {
  final List<Map<String, dynamic>> educationalDetails;
  final List<bool> isExpandedList;
  final void Function(int, bool) onExpansionChanged;

  EducationDetailsPanel({
    required this.educationalDetails,
    required this.isExpandedList,
    required this.onExpansionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // ... (unchanged code)

          ExpansionPanelList(
            elevation: 1,
            children: educationalDetails.asMap().entries.map(
                  (entry) => ExpansionPanel(
                headerBuilder: (context, isExpanded) {
                  return ListTile(
                    title: Text(entry.value['type']),
                  );
                },
                body: ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var key in entry.value['details'].keys)
                        ListTile(
                          title: Text('$key: ${entry.value['details'][key]}'),
                        ),
                    ],
                  ),
                ),
                isExpanded: isExpandedList[entry.key],
                canTapOnHeader: true,
                backgroundColor: Colors.white,
              ),
            ).toList(),
            expansionCallback: (panelIndex, isExpanded) =>
                onExpansionChanged(panelIndex, isExpandedList[panelIndex]),
          ),

        ],
      ),
    );
  }
}


List<Map<String, dynamic>> educationalDetails = [
  {
    'type': 'High School',
    'details': {
      'School': 'ABC High School',
      'Board': 'State Board',
      'Passing Year': '2020',
      'Subjects': 'Maths, Science, English',
      'Percentage': '85%',
    },
  },
  {
    'type': 'Higher Secondary School',
    'details': {
      'School': 'XYZ Higher Secondary School',
      'Board': 'State Board',
      'Passing Year': '2022',
      'Subjects': 'Physics, Chemistry, Biology',
      'Percentage': '92%',
    },
  },
  {
    'type': 'College',
    'details': {
      'Name': 'Global Engineering College',
      'Semester': '3rd',
      'Branch': 'Computer Science',
      'CGPA': '9.5',
    },
  },
  {
    'type': 'Internship',
    'details': {
      'Company': 'Tech Solutions Ltd.',
      'Duration': '3 months',
      'Role': 'Software Developer Intern',
    },
  },
  {
    'type': 'Project',
    'details': {
      'Title': 'Smart Home Automation',
      'Duration': '6 months',
      'Description': 'Developed a system for automating home appliances using IoT',
    },
  },
  {
    'type': 'Achievements',
    'details': {
      '1': 'Winner - Coding Competition',
      '2': 'Runner-up - Science Exhibition',
    },
  },
];




// // import 'package:flutter/material.dart';
// //
// // import '../../../../common/widgets/appbar/appbar.dart';
// // import '../../../../utils/constants/colors.dart';
// // import '../../../../utils/constants/sizes.dart';
// //
// // class SettingsScreen extends StatelessWidget {
// //   const SettingsScreen({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return const Scaffold(
// //       appBar: GAppBar(
// //         showBackArrow: false,
// //         title: Text(
// //           'Account',
// //           style: TextStyle(
// //               fontSize: ESizes.appTitle,
// //               color: EColors.white,
// //               fontWeight: FontWeight.w600),
// //         ),
// //         backgroundColor: EColors.primary,
// //         centerTitle: true,
// //       ),
// //       body: SingleChildScrollView(
// //         child: Column(
// //           children: [
// //
// //
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
//
// import 'package:flutter/material.dart';
// import 'package:globalcollegeapp/common/widgets/texts/top_first_heading.dart';
// import '../../../../common/widgets/appbar/appbar.dart';
// import '../../../../common/widgets/list_tile/settings_menu_tile.dart';
// import '../../../../utils/constants/colors.dart';
// import '../../../../utils/constants/image_strings.dart';
//
//
// //
// // class SettingsScreen extends StatelessWidget {
// //   const SettingsScreen({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: const GAppBar(
// //         showBackArrow: false,
// //         title: Text(
// //           'Account',
// //           style: TextStyle(
// //               fontSize: ESizes.appTitle,
// //               color: EColors.white,
// //               fontWeight: FontWeight.w600),
// //         ),
// //         backgroundColor: EColors.primary,
// //         centerTitle: true,
// //       ),
// //
// //       // Body ---
// //       body: Column(
// //         children: [
// //           Expanded(child: TimetableScreen()),
// //         ],
// //       )
// //     );
// //   }
// // }
// class SettingsScreen extends StatefulWidget {
//   const SettingsScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SettingsScreen> createState() => _SettingsScreenState();
// }
//
// class _SettingsScreenState extends State<SettingsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: EColors.backgroundColor,
//       appBar: const GAppBar(
//         showBackArrow: false,
//         title: Text(
//           'Account',
//           style: TextStyle(
//             fontSize: 20.0,
//             color: Colors.white,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         backgroundColor: EColors.primary,
//         centerTitle: true,
//       ),
//       body: DefaultTabController(
//         length: 2, // Number of tabs
//         child: Column(
//           children: [
//             const Padding(
//               padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
//               child: Row(
//                 children: [
//                   TopHeading(
//                     text: 'Hello,',
//                     fontSize: 20,
//                   ),
//                   Text(' Surya Pratap Singh', style: TextStyle(fontSize: 16)),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 10, top: 10),
//               child: Row(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(100),
//                     child: Image.asset(
//                       EImages.userIcon,
//                       fit: BoxFit.cover,
//                       width: 80,
//                       height: 80,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             // Add the TabBar here
//             const TabBar(
//               tabs: [
//                 Tab(text: 'Profile Details'),
//                 Tab(text: 'Educational Details'),
//               ],
//             ),
//             // Add the TabBarView here
//             Expanded(
//               child: TabBarView(
//                 children: [
//                   UserDetails(data: personalDetails,),
//                   EducationDetailsPanel(educationalDetails),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
// class UserDetails extends StatelessWidget {
//   final Map<String, String> data;
//
//   const UserDetails({Key? key, required this.data, })
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(8),
//       child: ListView(
//         shrinkWrap: true,
//         physics: const BouncingScrollPhysics(),
//         children: data.entries.map((entry) {
//           return Padding(
//             padding: const EdgeInsets.only(bottom: 16),
//             child: ESettingsMenuTile(
//               title: entry.key,
//               subTitle: entry.value,
//               onTap: () {
//                 // Add any onTap functionality here if needed
//               },
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }
//
// Map<String, String> personalDetails = {
//   'Gn No': 'G/2023/Engg/CS56',
//   'Enrollment Number': '121CS12024',
//   'Father’s Name': 'Jon Wick Jones',
//   'Mother’s Name': 'Jon Wick Jones',
//   'Date of Birth': 'Jan 01 2024',
//   'Contact No': '9898987777',
//   'Course': 'Engg',
//   'Branch': 'CS',
//   'Address': 'Jabalpur, M.P. 482001',
//   'Parent Contact': '7979797777',
//   'Email': 'google@gmail.com',
//   'Category': 'General',
//   'Blood Group': 'A+',
//   'Aadhaar No': '1245 6789 1234 5678',
//   'Samarga Id': '121JBP456',
//   'Laptop': 'YES',
// };
//
// class EducationDetailsPanel extends StatefulWidget {
//   final List<Map<String, dynamic>> educationalDetails;
//
//   EducationDetailsPanel(this.educationalDetails);
//
//   @override
//   _EducationDetailsPanelState createState() => _EducationDetailsPanelState();
// }
//
// class _EducationDetailsPanelState extends State<EducationDetailsPanel> {
//   late List<bool> _isExpandedList;
//
//   @override
//   void initState() {
//     super.initState();
//     _isExpandedList = List.generate(widget.educationalDetails.length, (index) => false);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: ExpansionPanelList(
//               elevation: 1,
//               children: widget.educationalDetails
//                   .asMap()
//                   .entries
//                   .map(
//                     (entry) => ExpansionPanel(
//                   headerBuilder: (context, isExpanded) {
//                     return ListTile(
//                       title: Text(entry.value['type']),
//                     );
//                   },
//                   body: ListTile(
//                     title: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         for (var key in entry.value['details'].keys)
//                           ListTile(
//                             title: Text('$key: ${entry.value['details'][key]}'),
//                           ),
//                       ],
//                     ),
//                   ),
//                   isExpanded: _isExpandedList[entry.key],
//                   canTapOnHeader: true,
//                   backgroundColor: Colors.white,
//                 ),
//               )
//                   .toList(),
//               expansionCallback: (panelIndex, isExpanded) {
//                 setState(() {
//                   _isExpandedList[panelIndex] = !isExpanded;
//                 });
//               },
//             ),
//           ),
//
//           Text('data'),
//
//         ],
//       ),
//     );
//   }
// }
//
//
// List<Map<String, dynamic>> educationalDetails = [
//   {
//     'type': 'High School',
//     'details': {
//       'School': 'ABC High School',
//       'Board': 'State Board',
//       'Passing Year': '2020',
//       'Subjects': 'Maths, Science, English',
//       'Percentage': '85%',
//     },
//   },
//   {
//     'type': 'Higher Secondary School',
//     'details': {
//       'School': 'XYZ Higher Secondary School',
//       'Board': 'State Board',
//       'Passing Year': '2022',
//       'Subjects': 'Physics, Chemistry, Biology',
//       'Percentage': '92%',
//     },
//   },
//   {
//     'type': 'College',
//     'details': {
//       'Name': 'Global Engineering College',
//       'Semester': '3rd',
//       'Branch': 'Computer Science',
//       'CGPA': '9.5',
//     },
//   },
//   {
//     'type': 'Internship',
//     'details': {
//       'Company': 'Tech Solutions Ltd.',
//       'Duration': '3 months',
//       'Role': 'Software Developer Intern',
//     },
//   },
//   {
//     'type': 'Project',
//     'details': {
//       'Title': 'Smart Home Automation',
//       'Duration': '6 months',
//       'Description': 'Developed a system for automating home appliances using IoT',
//     },
//   },
//   {
//     'type': 'Achievements',
//     'details': {
//       '1': 'Winner - Coding Competition',
//       '2': 'Runner-up - Science Exhibition',
//     },
//   },
// ];
//
