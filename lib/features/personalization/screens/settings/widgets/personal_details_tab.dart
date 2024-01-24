import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/list_tile/settings_menu_tile.dart';
import '../../../../../utils/constants/colors.dart';
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


class UserDetails extends StatelessWidget {
  final Map<String, String> data;

  const UserDetails({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        height: 340,
        decoration: ShapeDecoration(
          color: EColors.lightContainer1,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          ),
        ),
        margin: const EdgeInsets.all(8),
        child: Scrollbar(
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: data.entries.map((entry) {
              return ESettingsMenuTile(
                title: entry.key,
                subTitle: entry.value,
                onTap: () {
                  // Add any onTap functionality here if needed
                },
                icon: Iconsax.document_text_14,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}