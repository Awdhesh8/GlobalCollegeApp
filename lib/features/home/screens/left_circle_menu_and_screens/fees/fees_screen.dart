import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalcollegeapp/common/widgets/appbar/appbar.dart';
import 'package:globalcollegeapp/features/home/screens/left_circle_menu_and_screens/fees/semister_fees/semister_fees_screen.dart';
import 'package:globalcollegeapp/utils/constants/colors.dart';
import 'package:globalcollegeapp/common/widgets/profile_image_name/profile_header_name_image.dart';
import 'package:globalcollegeapp/common/widgets/texts/text_styles.dart';
import 'fees_contanier/fees_contents_contanier.dart';

class FeesScreen extends StatelessWidget {
  const FeesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EColors.backgroundColor,
      appBar: const GAppBar(
        backgroundColor: Colors.transparent,
        showBackArrow: true,
        centerTitle: true,
        title: Text(
          'Fees',
          style: TextStyle(
            color: EColors.textColorPrimary1,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
               Padding(
                padding: const EdgeInsets.only(right: 40),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: EColors.backgroundColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.pinkAccent,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.pinkAccent.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.person,
                          color: EColors.backgroundColor,
                          size: 40,
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Surya Pratap Singh',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: EColors.textColorPrimary1,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'GN/212/ME/2024/CS',
                              style:  TextStyle(
                                fontSize: 14,
                                color: EColors.textColorPrimary1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Divider(
                height: 10,
                thickness: 1,
                color: EColors.textColorPrimary1,
              ),
              const SizedBox(height: 20),
              _buildTitleContainer('Breakdown of Student Fees by Semester'),
              // _buildTableHeader(),
              _buildFeesData(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleContainer(String title) {
    return Container(
      decoration: BoxDecoration(
        color: EColors.textColorPrimary1.withOpacity(0.7),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          CustomTextStyle(
            text: title,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildTableHeader() {
    return Container(
      decoration: BoxDecoration(
        color: EColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: const Row(
        children: [
          SizedBox(width: 8),
          CustomTextStyle(text: 'Semester'),
          SizedBox(width: 15),
          CustomTextStyle(text: 'Per Semester'),
          SizedBox(width: 20),
          CustomTextStyle(text: 'Paid Amount'),
        ],
      ),
    );
  }

  Widget _buildFeesData() {
    return Column(
      children: [
        FeesData(),
      ],
    );
  }
}

class FeesData extends StatelessWidget {
  final List<Map<String, dynamic>> semesterDetails = [
    {
      'Semester': '1',
      'Per Semester': '15000.00',
      'Paid Amount': '20000.00',
      'View More': {
        'Admission Fee': 2000,
        'Student’s Welfare Fund': 750,
        'Modernization': 1500,
        'Library Security Deposit': 4242,
        'Tuition Fee': 45455,
        'Examination': 4242,
        'Registration': 4222
      },
      'Total': 45445
    },
    {
      'Semester': '2',
      'Per Semester': '15000.00',
      'Paid Amount': '20000.00',
      'View More': {
        'Admission Fee': 2000,
        'Student’s Welfare Fund': 750,
        'Modernization': 1500,
        'Library Security Deposit': 4242,
        'Tuition Fee': 45455,
        'Examination': 4242,
        'Registration': 4222
      },
      'Total': 45445
    },
    {
      'Semester': '3',
      'Per Semester': '14000.00',
      'Paid Amount': '40000.00',
      'View More': {
        'Admission Fee': 2000,
        'Student’s Welfare Fund': 750,
        'Modernization': 1500,
        'Library Security Deposit': 4242,
        'Tuition Fee': 45455,
        'Examination': 4242,
        'Registration': 4222
      },
      'Total': 45445
    },
    // Add similar entries for other semesters
  ];

  final Map<String, String> totalDetails = {
    'Total': 'Total',
    'Total Amt': '72000.00',
    'Per Semester total': '30000.00',
    'Paid Amount total': '40000.00',
    'Balance Amount': 'Balance Amount',
    'Total Balance Amount': '1,23,569.00',
  };

  FeesData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var details in semesterDetails)
          _buildFeesDataContainer(details),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Divider(height: 4),
        ),
        _buildTotalFeesDataContainer(totalDetails),
        _buildTotalFeesDataContainer({
          'Total': 'Balance Amount',
          'Total Amt': '1,23,569.00',
          'Per Semester total': '',
          'Paid Amount total': '',
          'Balance Amount': '',
          'Total Balance Amount': '',
        }),
      ],
    );
  }

  Widget _buildFeesDataContainer(Map<String, dynamic> details) {
    return GestureDetector(
      onTap: () {
        Get.to(() => SemesterFeesScreen(data: details));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: EColors.backgroundColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.red.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Semester ${details['Semester']}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: EColors.textColorPrimary1,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(
                        Icons.payment,
                        color: Colors.pinkAccent,
                        size: 18,
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          'Per Semester: ₹${details['Per Semester']}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: EColors.textColorPrimary1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.attach_money,
                        color: Colors.pinkAccent,
                        size: 18,
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          'Paid Amount: ₹${details['Paid Amount']}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: EColors.textColorPrimary1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.redAccent.shade400,
                boxShadow: [
                  BoxShadow(
                    color: Colors.pinkAccent.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Icon(
                Icons.arrow_forward_ios,
                color: EColors.backgroundColor,
                size: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTotalFeesDataContainer(Map<String, String> details) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: EColors.backgroundColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.red.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            details['Total'] ?? '',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: EColors.textColorPrimary1,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(
                Icons.payment,
                color: Colors.pinkAccent,
                size: 18,
              ),
              const SizedBox(width: 5),
              Text(
                'Total Amt: ${details['Total Amt']}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: EColors.textColorPrimary1,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.attach_money,
                color: Colors.pinkAccent,
                size: 18,
              ),
              const SizedBox(width: 5),
              Text(
                'Per Semester total: ${details['Per Semester total']}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: EColors.textColorPrimary1,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.monetization_on,
                color: Colors.pinkAccent,
                size: 18,
              ),
              const SizedBox(width: 5),
              Text(
                'Paid Amount total: ${details['Paid Amount total']}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: EColors.textColorPrimary1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(
                Icons.account_balance_wallet,
                color: Colors.pinkAccent,
                size: 18,
              ),
              const SizedBox(width: 5),
              Text(
                'Balance Amount: ${details['Balance Amount']}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: EColors.textColorPrimary1,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.money_off,
                color: Colors.pinkAccent,
                size: 18,
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  'Total Balance Amount: ${details['Total Balance Amount']}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: EColors.textColorPrimary1,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}






/// ORIGINAL CODE ---->>>
/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalcollegeapp/features/home/screens/left_circle_menu_and_screens/fees/semister_fees/semister_fees_screen.dart';
import 'package:globalcollegeapp/utils/constants/colors.dart';
import 'package:globalcollegeapp/common/widgets/appbar/appbar.dart';
import 'package:globalcollegeapp/utils/constants/sizes.dart';
import '../../../../../common/widgets/profile_image_name/profile_header_name_image.dart';
import '../../../../../common/widgets/texts/text_styles.dart';
import 'fees_contanier/fees_contents_contanier.dart';

class FeesScreen extends StatelessWidget {
  const FeesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EColors.backgroundColor,
      appBar: const GAppBar(
        backgroundColor: Colors.transparent,
        showBackArrow: true,
        centerTitle: true,
        title: Text(
          'Fees',
          style: TextStyle(
            color: EColors.textColorPrimary1,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: Column(
            children: [
              /// --- Circular Avatar User Profile Image & Edit Button ---
              const Padding(
                padding: EdgeInsets.only(right: 40),
                child: UserProfile(
                  userText2: 'Surya Pratap Singh',
                  userText: 'GN/212/ME/2024/CS',
                  imagePath: 'assets/images/user_icon.png',
                  showEditButton: false,
                  width: 80,
                  height: 80,
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Divider(
                  height: 10,
                ),
              ),

              const SizedBox(
                height: ESizes.spaceBtwItemsHeadings,
              ),

              /// Heading Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF823333),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomTextStyle(
                          text: 'Breakdown of Student Fees by Semester',
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              /// Heading | Title Text
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: EColors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 8,
                        ),
                        CustomTextStyle(
                          text: 'Semester',
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        CustomTextStyle(
                          text: 'Per Semester',
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CustomTextStyle(
                          text: 'Paid Amount',
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Container(
                decoration: BoxDecoration(
                  color: EColors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    FeesData(),
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

class FeesData extends StatelessWidget {
  final List<Map<String, dynamic>> semesterDetails = [
    {
      'Semester': '1',
      'Per Semester': '15000.00',
      'Paid Amount': '20000.00',
      'View More': {
        'Admission Fee': 2000,
        'Student’s Welfare Fund': 750,
        'Modernization': 1500,
        'Library Security Deposit': 4242,
        'Tuition Fee': 45455,
        'Examination': 4242,
        'Registration': 4222
      },
      'Total': 45445
    },
    {
      'Semester': '2',
      'Per Semester': '15000.00',
      'Paid Amount': '20000.00',
      'View More': {
        'Admission Fee': 2000,
        'Student’s Welfare Fund': 750,
        'Modernization': 1500,
        'Library Security Deposit': 4242,
        'Tuition Fee': 45455,
        'Examination': 4242,
        'Registration': 4222
      },
      'Total': 45445
    },
    // Add similar entries for other semesters
  ];

  final Map<String, String> totalDetails = {
    'Total': 'Total',
    'Total Amt': '72000.00',
    'Per Semester total': '30000.00',
    'Paid Amount total': '40000.00',
    'Balance Amount': 'Balance Amount',
    'Total Balance Amount': '1,23,569.00',
  };

  FeesData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var details in semesterDetails)
          FeesDataContainer(
            semester: details['Semester'] ?? '',
            preSemester: details['Per Semester'] ?? '',
            paidAmount: details['Paid Amount'] ?? '',
            onPressed: () {
              Get.to(() => SemesterFeesScreen(data: details));
            },
          ),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Divider(height: 4),
        ),
        TotalFeesDataContainer(
          totalText: totalDetails['Total'] ?? '',
          preSemester: totalDetails['Total Amt'] ?? '',
          paidAmount: totalDetails['Paid Amount total'] ?? '',
        ),
        TotalFeesDataContainer(
          totalText: totalDetails['Balance Amount'] ?? '',
          preSemester: totalDetails['Total Balance Amount'] ?? '',
          paidAmount: '',
        ),
      ],
    );
  }
}


 */



/// ------------>>>>>>>>>>>>>>>>>>
// class FeesData extends StatelessWidget {
//   final List<Map<String, String>> semesterDetails = [
//     {'Semester': '1', 'Per Semester': '15000.00', 'Paid Amount': '20000.00'},
//     {'Semester': '2', 'Per Semester': '15000.00', 'Paid Amount': '20000.00'},
//     {'Semester': '3', 'Per Semester': '15000.00', 'Paid Amount': '20000.00'},
//     {'Semester': '4', 'Per Semester': '2000.00', 'Paid Amount': '20000.00'},
//     {'Semester': '5', 'Per Semester': '10000.00', 'Paid Amount': '20000.00'},
//     {'Semester': '6', 'Per Semester': '15000.00', 'Paid Amount': '20000.00'},
//     {'Semester': '7', 'Per Semester': '15000.00', 'Paid Amount': '20000.00'},
//     {'Semester': '8', 'Per Semester': '15000.00', 'Paid Amount': '20000.00'},
//
//     //   "Total" :
//     // 'Per Semester total': '30000.00',
//     //  'Paid Amount total': '40000.00',
//     // 'Balance Amount': 'Balance Amount',
//     // 'Total Balance Amount': '1,23,569.00',
//
//   ];
//
//   final Map<String, String> totalDetails = {
//     'Total': 'Total',
//     'Total Amt': '72000.00',
//     'Per Semester total': '30000.00',
//     'Paid Amount total': '40000.00',
//     'Balance Amount': 'Balance Amount',
//     'Total Balance Amount': '1,23,569.00',
//   };
//
//   FeesData({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         for (var details in semesterDetails)
//           FeesDataContainer(
//             semester: details['Semester'] ?? '',
//             preSemester: details['Per Semester'] ?? '',
//             paidAmount: details['Paid Amount'] ?? '',
//             onPressed: () => Get.to(() => const SemesterFeesScreen()),
//           ),
//
//         // FeesTotalRow(
//         //   totalPerSemesters: semesterDetails
//         //       .map((details) => double.parse(details['Per Semester']!))
//         //       .toList(),
//         //   totalPaidAmounts: semesterDetails
//         //       .map((details) => double.parse(details['Paid Amount']!))
//         //       .toList(),
//         // ),
//
//         // FeesDataContainer(
//         //   semester: totalDetails['Total'] ?? '',
//         //   preSemester: totalDetails['Per Semester total'] ?? '',
//         //   paidAmount: totalDetails['Paid Amount total'] ?? '',
//         // ),
//
//         const SizedBox(
//           height: 10,
//         ),
//         const Padding(
//           padding: EdgeInsets.symmetric(horizontal: 15),
//           child: Divider(height: 4),
//         ),
//
//         TotalFeesDataContainer(
//           totalText: totalDetails['Total'] ?? '',
//           preSemester: totalDetails['Total Amt'] ?? '',
//           paidAmount: totalDetails['Paid Amount total'] ?? '',
//         ),
//
//         TotalFeesDataContainer(
//           totalText: totalDetails['Balance Amount'] ?? '',
//           preSemester: totalDetails['Total Balance Amount'] ?? '',
//           paidAmount: '',
//         ),
//       ],
//     );
//   }
// }
// class FeesTotalRow extends StatelessWidget {
//   final List<double> totalPerSemesters;
//   final List<double> totalPaidAmounts;
//
//   const FeesTotalRow({
//     super.key,
//     required this.totalPerSemesters,
//     required this.totalPaidAmounts,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final double totalPerSemestersSum =
//         totalPerSemesters.reduce((a, b) => a + b);
//     final double totalPaidAmountsSum = totalPaidAmounts.reduce((a, b) => a + b);
//
//     return ListTile(
//       title: const Text('Total'),
//       subtitle: Text(' ${totalPerSemestersSum.toStringAsFixed(2)}'),
//       trailing: Text(' ${totalPaidAmountsSum.toStringAsFixed(2)}'),
//     );
//   }
// }
