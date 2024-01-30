import 'package:flutter/material.dart';
import 'package:globalcollegeapp/utils/constants/colors.dart';
import 'package:globalcollegeapp/common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/profile_image_name/profile_header_name_image.dart';
import 'fees_contanier/fees_contents_contanier.dart';

class FeesScreen extends StatelessWidget {
  const FeesScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: EColors.backgroundColor,
      appBar: GAppBar(
        backgroundColor: Colors.transparent,
        showBackArrow: true,
        title: Text(
          'Fees',
          style: TextStyle(
            color: EColors.textColorPrimary1,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [

          /// --- Circular Avatar User Profile Image & Edit Button ---
          Padding(
            padding: EdgeInsets.only(right: 40),
            child: UserProfile(
              userText: 'GN/212/ME/2024/CS',
              imagePath: 'assets/images/user_icon.png',
              showEditButton: false,
              width: 80,
              height: 80,
            ),
          ),




        ],
      ),
    );
  }
}


class FeesData extends StatelessWidget {
  final List<Map<String, String>> semesterDetails = [
    {'Semester': '1', 'Per Semester': '15000.00', 'Paid Amount': '20000.00'},
    {'Semester': '2', 'Per Semester': '15000.00', 'Paid Amount': '20000.00'},
    {'Semester': '3', 'Per Semester': '15000.00', 'Paid Amount': '20000.00'},
    {'Semester': '4', 'Per Semester': '2000.00', 'Paid Amount': '20000.00'},
    {'Semester': '5', 'Per Semester': '10000.00', 'Paid Amount': '20000.00'},
    {'Semester': '6', 'Per Semester': '15000.00', 'Paid Amount': '20000.00'},


    //   "Total" :
    // 'Per Semester total': '30000.00',
    //  'Paid Amount total': '40000.00',
    // 'Balance Amount': 'Balance Amount',
    // 'Total Balance Amount': '1,23,569.00',
  ];

  final Map<String, String> totalDetails = {
    'Total': 'Total',
    'Total Amt': '72000.00',
    'Per Semester total': '30000.00',
    'Paid Amount total': '40000.00',
    'Balance Amount': 'Balance Amount',
    'Total Balance Amount': '1,23,569.00',
  };

  FeesData({super.key, });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          for (var details in semesterDetails)
            FeesDataContainer(
              semester: details['Semester'] ?? '',
              preSemester: details['Per Semester'] ?? '',
              paidAmount: details['Paid Amount'] ?? '',
            ),


          // FeesTotalRow(
          //   totalPerSemesters: semesterDetails
          //       .map((details) => double.parse(details['Per Semester']!))
          //       .toList(),
          //   totalPaidAmounts: semesterDetails
          //       .map((details) => double.parse(details['Paid Amount']!))
          //       .toList(),
          // ),

          // FeesDataContainer(
          //   semester: totalDetails['Total'] ?? '',
          //   preSemester: totalDetails['Per Semester total'] ?? '',
          //   paidAmount: totalDetails['Paid Amount total'] ?? '',
          // ),
          const SizedBox(height: 10,),
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
      ),
    );
  }
}

class FeesTotalRow extends StatelessWidget {
  final List<double> totalPerSemesters;
  final List<double> totalPaidAmounts;

  const FeesTotalRow({super.key,
    required this.totalPerSemesters,
    required this.totalPaidAmounts,
  });

  @override
  Widget build(BuildContext context) {
    final double totalPerSemestersSum = totalPerSemesters.reduce((a, b) => a + b);
    final double totalPaidAmountsSum = totalPaidAmounts.reduce((a, b) => a + b);

    return ListTile(
      title: const Text('Total'),
      subtitle: Text(' ${totalPerSemestersSum.toStringAsFixed(2)}'),
      trailing: Text(' ${totalPaidAmountsSum.toStringAsFixed(2)}'),
    );
  }
}