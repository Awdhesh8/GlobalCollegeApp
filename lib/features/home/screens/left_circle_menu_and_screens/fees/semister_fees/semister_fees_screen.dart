// import 'package:flutter/material.dart';
// import 'package:globalcollegeapp/common/widgets/appbar/appbar.dart';
// import 'package:globalcollegeapp/utils/constants/colors.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
// class SemesterFeesScreen extends StatelessWidget {
//   final Map<String, dynamic> data;
//
//   const SemesterFeesScreen({Key? key, required this.data}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: EColors.backgroundColor,
//       appBar: GAppBar(
//         backgroundColor: Colors.transparent,
//         showBackArrow: true,
//         centerTitle: true,
//         title: Text(
//           'Semester ${data['Semester']} Details',
//           style: const TextStyle(
//             color: EColors.textColorPrimary1,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [Colors.pink.shade50, Colors.pink.shade100, Colors.pink.shade500],
//             ),
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildInfoCard('Per Semester', '₹${data['Per Semester']}'),
//               _buildInfoCard('Paid Amount', '₹${data['Paid Amount']}'),
//               const SizedBox(height: 20),
//               _buildSectionTitle('View More Details'),
//               _buildDetailsList(data['View More']),
//               const SizedBox(height: 20),
//               _buildInfoCard('Total', '₹${data['Total']}'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildInfoCard(String title, String value) {
//     return Card(
//       elevation: 5,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//       child: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Icon(
//                   FontAwesomeIcons.solidCreditCard,
//                   color: EColors.textColorPrimary1,
//                   size: 24,
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//             Text(
//               value,
//               style: const TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.w600,
//                 color: EColors.textColorPrimary1,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSectionTitle(String title) {
//     return Text(
//       title,
//       style: const TextStyle(
//         fontSize: 20,
//         fontWeight: FontWeight.bold,
//         color: EColors.textColorPrimary1,
//       ),
//     );
//   }
//
//   Widget _buildDetailsList(Map<String, dynamic> details) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: details.entries
//           .map(
//             (entry) => Padding(
//           padding: const EdgeInsets.only(top: 8),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 entry.key,
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               Text(
//                 '₹${entry.value}',
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w600,
//                   color: EColors.textColorPrimary1,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       )
//           .toList(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:globalcollegeapp/common/widgets/appbar/appbar.dart';
import 'package:globalcollegeapp/utils/constants/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SemesterFeesScreen extends StatelessWidget {
  final Map<String, dynamic> data;

  const SemesterFeesScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EColors.backgroundColor,
      appBar: GAppBar(
        backgroundColor: Colors.transparent,
        showBackArrow: true,
        centerTitle: true,
        title: Text(
          'Sem ${data['Semester']} ',
          style: const TextStyle(
            color: EColors.textColorPrimary1,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.all(20),
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
              _buildInfoCard('Per Semester', '₹${data['Per Semester']}'),
              const SizedBox(height: 20),
              _buildInfoCard('Paid Amount', '₹${data['Paid Amount']}'),
              const SizedBox(height: 20),
              _buildSectionTitle('View More Details'),
              _buildDetailsList(data['View More']),
              const SizedBox(height: 20),
              _buildInfoCard('Total', '₹${data['Total']}'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: EColors.backgroundColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.red.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: EColors.textColorPrimary1,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: EColors.textColorPrimary1,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(10),
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
              FontAwesomeIcons.solidCreditCard,
              color: EColors.backgroundColor,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: EColors.textColorPrimary1,
      ),
    );
  }

  Widget _buildDetailsList(Map<String, dynamic> details) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: details.entries
          .map(
            (entry) => Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Container(
              //   padding: const EdgeInsets.all(10),
              //   decoration: BoxDecoration(
              //     shape: BoxShape.circle,
              //     color: EColors.primary,
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.red.withOpacity(0.5),
              //         spreadRadius: 1,
              //         blurRadius: 5,
              //         offset: const Offset(0, 3),
              //       ),
              //     ],
              //   ),
              //   child: const Icon(
              //     FontAwesomeIcons.indianRupeeSign,
              //     color: EColors.white,
              //     size: 18,
              //   ),
              // ),
              Icon(
                FontAwesomeIcons.moneyCheck,
                color: EColors.primary,
                size: 18,
              ),
              // SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    entry.key,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: EColors.textColorPrimary1,
                    ),
                  ),
                  Text(
                    '₹${entry.value}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: EColors.textColorPrimary1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
          .toList(),
    );
  }
}

