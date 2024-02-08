import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../features/personalization/screens/settings/edit_profile/edit_Profile.dart';
import '../../../utils/constants/colors.dart';

class UserProfile extends StatelessWidget {
  final String userText;
  final String? userText2;
  final String imagePath;
  final double? width;
  final double? height;
  final bool showEditButton;
  final VoidCallback onPressed; // Define onPressed here


  const UserProfile({
    Key? key,
    required this.userText,
    required this.imagePath,
    this.showEditButton = true,
    this.width = 120,
    this.height = 120,
    this.userText2,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
      child: Column(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: imagePath.startsWith('http')
                            ? Image.network(
                          imagePath,
                          fit: BoxFit.fill,
                          width: width,
                          height: height,
                        )
                            : Image.asset(
                          imagePath,
                          fit: BoxFit.fill,
                          width: width,
                          height: height,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        userText2 ?? '',
                        style: const TextStyle(
                            fontSize: 16,),
                      ),
                      Text(
                        userText,
                        style:
                          const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: EColors.textColorPrimary1,
                          ),
                        ),
                      if (showEditButton) const SizedBox(height: 8),
                      if (showEditButton) EditButton(onPressed: onPressed,),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class EditButton extends StatelessWidget {

  final VoidCallback onPressed;
  const EditButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
    // () {

        // Get.to(
        //       () => EditProfile(),
        //   transition: Transition.rightToLeftWithFade,
        //   duration: const Duration(milliseconds: 300),
        // );
      // },
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('Edit Profile'),
          SizedBox(width: 4),
          Icon(Iconsax.edit),
        ],
      ),
    );
  }
}

class NameText extends StatelessWidget {
  const NameText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('Edit Profile'),
        ],
      );
  }
}