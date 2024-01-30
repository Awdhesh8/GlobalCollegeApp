import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../features/personalization/screens/settings/edit_profile/edit_Profile.dart';

class UserProfile extends StatelessWidget {
  final String userText;
  final String? userText2;
  final String imagePath;
  final double? width;
  final double? height;
  final bool showEditButton;

  const UserProfile({super.key,
    required this.userText,
    required this.imagePath,
    this.showEditButton = true,
    this.width = 120,
    this.height = 120,
    this.userText2,
  });

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
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
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
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        userText,
                        style: const TextStyle(fontSize: 16),
                      ),
                      if (showEditButton) const SizedBox(height: 8),
                      if (showEditButton) const EditButton(),
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
  const EditButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Get.to(
              () => EditProfile(),
          transition: Transition.rightToLeftWithFade,
          duration: const Duration(milliseconds: 300),
        );
      },
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