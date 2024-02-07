import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../common/widgets/list_tile/settings_menu_tile.dart';
import '../../../../../utils/constants/colors.dart';

// class UserDetails extends StatelessWidget {
//   final Map<String, dynamic> data;
//
//   const UserDetails({Key? key, required this.data}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       physics: const BouncingScrollPhysics(),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//         child: Container(
//           height: 380,
//           decoration: BoxDecoration(
//             color: const Color(0xFFFFE0E5),
//             borderRadius: BorderRadius.circular(20),
//             boxShadow: const [
//               BoxShadow(
//                 color: Color(0xFFFFC1C5),
//                 offset: Offset(-2, -2),
//                 blurRadius: 5,
//                 spreadRadius: 1,
//               ),
//               BoxShadow(
//                 color: Colors.white,
//                 offset: Offset(5, 5),
//                 blurRadius: 5,
//                 spreadRadius: 1,
//               ),
//             ],
//           ),
//           margin: const EdgeInsets.all(8),
//           child: data.isNotEmpty
//               ? Scrollbar(
//             child: ListView(
//               shrinkWrap: true,
//               physics: const BouncingScrollPhysics(),
//               children: data.entries.map((entry) {
//                 return ESettingsMenuTile(
//                   title: entry.key,
//                   subTitle: entry.value.toString(),
//                   onTap: () {
//                     // Add any onTap functionality here if needed
//                   },
//                   icon: Iconsax.document_text_14,
//                 );
//               }).toList(),
//             ),
//           )
//               : Shimmer.fromColors(
//             baseColor: Colors.grey[300]!,
//             highlightColor: Colors.grey[100]!,
//             child: ListView.builder(
//               shrinkWrap: true,
//               itemCount: 5, // Adjust the number of shimmer lines as needed
//               itemBuilder: (_, __) => ListTileShimmer(),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class UserDetails extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  const UserDetails({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Container(
          height: 380,
          decoration: BoxDecoration(
            color: const Color(0xFFFFE0E5),
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Color(0xFFFFC1C5),
                offset: Offset(-2, -2),
                blurRadius: 5,
                spreadRadius: 1,
              ),
              BoxShadow(
                color: Colors.white,
                offset: Offset(5, 5),
                blurRadius: 5,
                spreadRadius: 1,
              ),
            ],
          ),
          margin: const EdgeInsets.all(8),
          child: data.isNotEmpty
              ? Scrollbar(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final item = data[index];
                      return ESettingsMenuTile(
                        title: item['type'] ?? '',
                        subTitle: item['value']?.toString() ?? '',
                        onTap: () {
                          // Add any onTap functionality here if needed
                        },
                        icon: Iconsax.document_text_14,
                      );
                    },
                  ),
                )
              : Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount:
                        5, // Adjust the number of shimmer lines as needed
                    itemBuilder: (_, __) => ListTileShimmer(),
                  ),
                ),
        ),
      ),
    );
  }
}

class ListTileShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Container(
        height: 16,
        width: MediaQuery.of(context).size.width * 0.5,
        color: Colors.grey[300],
      ),
      subtitle: Container(
        height: 12,
        width: MediaQuery.of(context).size.width * 0.3,
        color: Colors.grey[300],
      ),
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';
// import '../../../../../common/widgets/list_tile/settings_menu_tile.dart';
// import '../../../../../utils/constants/colors.dart';
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
// class UserDetails extends StatelessWidget {
//   final Map<String, String> data;
//
//   const UserDetails({Key? key, required this.data}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       physics: const BouncingScrollPhysics(),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
//         child: Container(
//           height: 380,
//           decoration: BoxDecoration(
//             color: const Color(0xFFFFE0E5),
//             borderRadius: BorderRadius.circular(20),
//             boxShadow: const [
//               BoxShadow(
//                 color: Color(0xFFFFC1C5),
//                 offset: Offset(-2, -2),
//                 blurRadius: 5,
//                 spreadRadius: 1,
//               ),
//               BoxShadow(
//                 color: Colors.white,
//                 offset: Offset(5, 5),
//                 blurRadius: 5,
//                 spreadRadius: 1,
//               ),
//             ],
//           ),
//           margin: const EdgeInsets.all(8),
//           child: Scrollbar(
//             child: ListView(
//               shrinkWrap: true,
//               physics: const BouncingScrollPhysics(),
//               children: data.entries.map((entry) {
//                 return ESettingsMenuTile(
//                   title: entry.key,
//                   subTitle: entry.value,
//                   onTap: () {
//                     // Add any onTap functionality here if needed
//                   },
//                   icon: Iconsax.document_text_14,
//                 );
//               }).toList(),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
