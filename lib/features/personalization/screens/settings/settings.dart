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
import 'package:iconsax/iconsax.dart';
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
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
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
                  UserDetails(data: personalDetails, scrollController: ScrollController(),),
                  EducationalDetails(data: educationalDetails , scrollController: ScrollController(),),
                  // EducationalDetails(data: educationalDetails, scrollController: ScrollController(),),
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
  final ScrollController scrollController;

  const UserDetails({Key? key, required this.data, required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Scrollbar(
        controller: scrollController,
        radius: const Radius.circular(10),
        thickness: 4,
        thumbVisibility: true,
        child: ListView(
          controller: scrollController,
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


class EducationalDetails extends StatefulWidget {
  final Map<String, Map<String, String>> data;

  const EducationalDetails({Key? key, required this.data, required ScrollController scrollController}) : super(key: key);

  @override
  _EducationalDetailsState createState() => _EducationalDetailsState();
}

class _EducationalDetailsState extends State<EducationalDetails> {
  Map<String, bool> visibilityMap = {};

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Scrollbar(
        radius: const Radius.circular(10),
        thickness: 4,
        thumbVisibility: true,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: widget.data.length,
          itemBuilder: (BuildContext context, int index) {
            String category = widget.data.keys.elementAt(index);
            Map<String, String> categoryData = widget.data[category]!;
            bool isExpanded = visibilityMap[category] == true;

            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                child: ExpansionPanelList(
                  elevation: 1,
                  expandedHeaderPadding: EdgeInsets.zero,
                  children: [
                    ExpansionPanel(
                      isExpanded: isExpanded,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                          title: Text(
                            category,
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        );
                      },
                      body: Column(
                        children: categoryData.entries.map((entry) {
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
                    ),
                  ],
                  expansionCallback: (int panelIndex, bool isExpanded) {
                    setState(() {
                      visibilityMap[category] = !isExpanded;
                    });
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}






// Map<String, String> educationalDetails = {
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
// };

Map<String, Map<String, String>> educationalDetails = {
  '10th': {
    'School': 'ABC High School',
    'Board': 'State Board',
    'Passing Year': '2020',
    'Subjects': 'Maths, Science, English',
    'Percentage': '85%',
  },
  '12th': {
    'School': 'XYZ Higher Secondary School',
    'Board': 'State Board',
    'Passing Year': '2022',
    'Subjects': 'Physics, Chemistry, Biology',
    'Percentage': '92%',
  },
  'College': {
    'Name': 'Global Engineering College',
    'Semester': '3rd',
    'Branch': 'Computer Science',
    'CGPA': '9.5',
  },
  'Internship': {
    'Company': 'Tech Solutions Ltd.',
    'Duration': '3 months',
    'Role': 'Software Developer Intern',
  },
  'Project': {
    'Title': 'Smart Home Automation',
    'Duration': '6 months',
    'Description': 'Developed a system for automating home appliances using IoT',
  },
  'Achievements': {
    '1': 'Winner - Coding Competition',
    '2': 'Runner-up - Science Exhibition',
  },
};
