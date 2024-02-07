// import 'package:flutter/material.dart';
// import 'package:globalcollegeapp/features/home/screens/profile_card/widgets/profile_card_back_side/profile_card_back_side.dart';
// import 'package:globalcollegeapp/features/home/screens/profile_card/widgets/profile_card_front_side/profile_front_side_card.dart';
// import '../../../../utils/constants/colors.dart';
// import 'package:flip_card/flip_card.dart';
//
// class ProfileBox extends StatefulWidget {
//   const ProfileBox({Key? key}) : super(key: key);
//
//   @override
//   State<ProfileBox> createState() => _ProfileBoxState();
// }
//
// class _ProfileBoxState extends State<ProfileBox> {
//   @override
//   Widget build(BuildContext context) {
//     return FlipCard(
//       direction: FlipDirection.VERTICAL, // Flip direction
//       flipOnTouch: true,
//       front: buildFront(),
//       back: buildBack(),
//     );
//   }
//
//   Widget buildFront() {
//     double containerWidth = MediaQuery.of(context).size.width * 0.9;
//     return Column(
//       children: [
//         Container(
//           width: containerWidth,
//           height: 125,
//           decoration: BoxDecoration(
//             color: EColors.primarySecond,
//             borderRadius: BorderRadius.circular(10),
//             boxShadow: const [
//               BoxShadow(
//                 offset: Offset(0, 0),
//                 blurRadius: 10,
//                 color: Colors.black12,
//               )
//             ],
//           ),
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//             ),
//             padding: const EdgeInsets.all(0),
//             child: const UserProfileWidget(
//               imageUrl:
//                   'assets/avaters/Avatar 6.jpg', // Replace with your image URL
//               name: 'Surya Pratap Singh',
//               branch: 'Computer Science Engineering',
//               courseType: 'Bachelor', enroll: '121ME2024CS',
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget buildBack() {
//     // Back side of the card here
//     return BackUserDetailsWidget(fatherName: '', motherName: '', studentSession: '', mobile: '', text: '',
//
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:globalcollegeapp/features/home/screens/profile_card/widgets/profile_card_back_side/profile_card_back_side.dart';
import 'package:globalcollegeapp/features/home/screens/profile_card/widgets/profile_card_front_side/profile_front_side_card.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../data/api/api_services.dart';
import '../../../../utils/constants/colors.dart';
import 'package:flip_card/flip_card.dart';

class ProfileBox extends StatefulWidget {
  const ProfileBox({Key? key}) : super(key: key);

  @override
  State<ProfileBox> createState() => _ProfileBoxState();
}

class _ProfileBoxState extends State<ProfileBox> {
  Map<String, dynamic>? profileData;

  @override
  void initState() {
    super.initState();
    fetchProfileData();
  }

  Future<void> fetchProfileData() async {
    try {
      final data = await ApiService.getProfileData();
      setState(() {
        profileData = data;
      });
    } catch (e) {
      print('Error fetching profile data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    print('Profile Data: $profileData');
    return FlipCard(
      direction: FlipDirection.VERTICAL,
      flipOnTouch: true,
      front: profileData != null ? buildFront() : buildShimmer(),
      back: profileData != null ? buildBack() : buildShimmer(),
    );
  }

  Widget buildShimmer() {
    double containerWidth = MediaQuery.of(context).size.width * 0.9;
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        width: containerWidth,
        height: 125,
      ),
    );
  }


  Widget buildFront() {
    double containerWidth = MediaQuery.of(context).size.width * 0.9;

    if (profileData?['response'] != null && profileData!['response'].isNotEmpty) {
      var responseData = profileData!['response'][0];

      // Find the index of 'Profile photo' in responseData
      int photoIndex = responseData.indexWhere((field) => field['type'] == 'Profile photo');

      // Use the profile photo URL if found, otherwise use a default image URL
      String imageUrl = photoIndex != -1 ? responseData[photoIndex]['value'] : 'assets/avaters/Avatar Default.jpg';

      return Column(
        children: [
          Container(
            width: containerWidth,
            height: 125,
            decoration: BoxDecoration(
              color: EColors.primarySecond,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 10,
                  color: Colors.black12,
                )
              ],
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(0),
              child: UserProfileWidget(
                imageUrl: imageUrl,
                name: responseData[0]['value'] ?? 'Unknown',
                branch: responseData[8]['value'] ?? 'Unknown',
                courseType: responseData[7]['value'] ?? 'Unknown',
                enroll: responseData[1]['value'] ?? 'Unknown',
              ),
            ),
          ),
        ],
      );
    } else {
      // Handle the case when response or its sublists are null or empty
      return Container(
        width: containerWidth,
        height: 125,
        decoration: BoxDecoration(
          color: EColors.primarySecond,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 10,
              color: Colors.black12,
            )
          ],
        ),
        child: Center(
          child: Text(
            'Profile data is not available.',
            style: TextStyle(
              color: EColors.textColorPrimary1,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }
  }



  Widget buildBack() {
    return BackUserDetailsWidget(
      fatherName: profileData?['response']?[0][3]['value'] ?? '',
      motherName: profileData?['response']?[0][4]['value'] ?? '',
      studentSession: profileData?['response']?[0][5]['value'] ?? '',
      mobile: profileData?['response']?[0][6]['value'] ?? '',
      text: '', // Replace with the actual details
    );
  }
}