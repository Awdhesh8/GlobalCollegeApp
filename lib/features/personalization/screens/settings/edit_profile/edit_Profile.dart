// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:globalcollegeapp/common/widgets/appbar/appbar.dart';
// import 'package:image_picker/image_picker.dart';
// import '../controllers/profile_controller.dart';
//
// class EditProfile extends StatelessWidget {
//   final ProfileController profileController = Get.put(ProfileController());
//
//   EditProfile({super.key});
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const GAppBar(
//         title: Text('Edit Profile'),
//         showBackArrow: true,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Hero(
//               tag: 'avatarHero',
//               child: CircularAvatar(
//                 imagePath: profileController.imagePath.value,
//                 onTap: () => _pickImage(context),
//               ),
//             ),
//             const SizedBox(height: 16),
//             _buildTextField('Contact Number', profileController.contactNumber),
//             _buildTextField('Email', profileController.email),
//             _buildTextField('Blood Group', profileController.bloodGroup),
//             _buildTextField('Samara ID', profileController.samaraId),
//             const SizedBox(height: 16),
//             _buildLaptopSection(),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _saveProfile,
//               child: const Text('Save'),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           _saveProfile();
//           Get.snackbar('Profile Updated', 'Your profile has been updated.');
//           Get.back();
//         },
//         child: const Icon(Icons.save),
//       ),
//     );
//   }
//
//   Widget _buildTextField(String label, RxString controller) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: TextField(
//         decoration: InputDecoration(
//           labelText: label,
//         ),
//         controller: TextEditingController(text: controller.value),
//         onChanged: (value) => controller.value = value,
//       ),
//     );
//   }
//
//   Widget _buildLaptopSection() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             const Text('Do you have a Laptop?'),
//             const SizedBox(width: 16),
//             Obx(
//                   () => Switch(
//                 value: profileController.hasLaptop.value,
//                 onChanged: (value) => profileController.toggleLaptop(value),
//               ),
//             ),
//           ],
//         ),
//         if (profileController.hasLaptop.value) ...[
//           _buildTextField('Laptop Brand', profileController.laptopBrand),
//           _buildTextField('Laptop RAM', profileController.laptopRam),
//           _buildTextField('Laptop Processor', profileController.laptopProcessor),
//           _buildTextField('Laptop Configuration', profileController.laptopConfig),
//         ],
//       ],
//     );
//   }
//
//   Future<void> _pickImage(BuildContext context) async {
//     final picker = ImagePicker();
//     final pickedFile = await showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Select Image Source'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ElevatedButton(
//                 onPressed: () async {
//                   Navigator.of(context).pop(await picker.pickImage(source: ImageSource.gallery));
//                 },
//                 child: const Text('Gallery'),
//               ),
//               ElevatedButton(
//                 onPressed: () async {
//                   Navigator.of(context).pop(await picker.pickImage(source: ImageSource.camera));
//                 },
//                 child: const Text('Camera'),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//
//     if (pickedFile != null) {
//       profileController.imagePath.value = pickedFile.path;
//     }
//   }
//
//   void _saveProfile() {
//     // Perform save logic here
//
//     /// back
//     Get.back();
//   }
// }
//
// class CircularAvatar extends StatelessWidget {
//   final String imagePath;
//   final VoidCallback onTap;
//
//   const CircularAvatar({super.key, required this.imagePath, required this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: CircleAvatar(
//         radius: 40,
//         backgroundImage: imagePath.isNotEmpty ? FileImage(File(imagePath)) : null,
//         child: imagePath.isEmpty ? const Icon(Icons.camera_alt) : null,
//       ),
//     );
//   }
// }

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalcollegeapp/common/widgets/appbar/appbar.dart';
import 'package:globalcollegeapp/utils/constants/colors.dart';
import 'package:image_picker/image_picker.dart';
import '../controllers/profile_controller.dart';

class EditProfile extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());

  EditProfile({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EColors.backgroundColor,
      appBar: const GAppBar(
        backgroundColor: Colors.transparent,
        title: Text('Edit Profile',
        style: TextStyle(
          color: EColors.primary
        ),
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: 'avatarHero',
              child: Obx(() => CircularAvatar(
                imagePath: profileController.imagePath.value,
                onTap: () => _pickImage(context),
                // Add an IconButton with an "Upload" icon
                uploadIcon: IconButton(
                  icon: const Icon(Icons.upload , color: Colors.white,),  // You can customize the icon here
                  onPressed: () => _pickImage(context),
                ),
              )),
            ),
            const SizedBox(height: 16),
            _buildTextField('Contact Number', profileController.contactNumber),
            _buildTextField('Email', profileController.email),
            _buildTextField('Blood Group', profileController.bloodGroup),
            _buildTextField('Samara ID', profileController.samaraId),
            const SizedBox(height: 16),
            _buildLaptopSection(),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _showConfirmationDialog(context);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, RxString controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            color: EColors.textColorPrimary1
          )
        ),
        controller: TextEditingController(text: controller.value),
        onChanged: (value) => controller.value = value,
      ),
    );
  }

  Widget _buildLaptopSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text('Do you have a Laptop?'),
            const SizedBox(width: 16),
            Obx(
                  () => Switch(
                    activeColor: EColors.primarySecond,
                value: profileController.hasLaptop.value,
                onChanged: (value) => profileController.toggleLaptop(value),
              ),
            ),
          ],
        ),
        Obx(() {
          if (profileController.hasLaptop.value) {
            return Column(
              children: [
                _buildTextField('Laptop Brand', profileController.laptopBrand),
                _buildTextField('Laptop RAM', profileController.laptopRam),
                _buildTextField('Laptop Processor', profileController.laptopProcessor),
                _buildTextField('Laptop Configuration', profileController.laptopConfig),
              ],
            );
          } else {
            return Container(); // Empty container when switch is off
          }
        }),
      ],
    );
  }

  Future<void> _pickImage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Image Source'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () async {
                  Navigator.of(context).pop(await picker.pickImage(source: ImageSource.gallery));
                },
                child: const Text('Gallery'),
              ),
              ElevatedButton(
                onPressed: () async {
                  Navigator.of(context).pop(await picker.pickImage(source: ImageSource.camera));
                },
                child: const Text('Camera'),
              ),
            ],
          ),
        );
      },
    );

    if (pickedFile != null) {
      profileController.imagePath.value = pickedFile.path;
    }
  }

  void _saveProfile() {
    // Perform save logic here
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Update Profile'),
          content: const Text('Do you really want to update your profile?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _updateProfileAndShowSnackbar(context);
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Get.back(); // Pop back to EditProfile
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _updateProfileAndShowSnackbar(BuildContext context) async {
    // Perform update logic here
    _saveProfile(); // Assuming this should save the profile

    // Show Snackbar
    await Get.snackbar(
      'Update Request Send',
      'Your profile has been update soon.',
      snackPosition: SnackPosition.TOP, // Change this position if needed
      duration: const Duration(seconds: 2), // Adjust duration as needed
    );

    // Navigate back to the SettingsScreen after Snackbar is closed
    Navigator.of(context).pop();
  }

}

class CircularAvatar extends StatelessWidget {
  final String imagePath;
  final Function onTap;
  final Widget uploadIcon; // Add this property

  const CircularAvatar({super.key, required this.imagePath, required this.onTap, required this.uploadIcon});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        GestureDetector(
          onTap: () => onTap(),
          child: CircleAvatar(
            radius: 50,
            backgroundImage: imagePath.isNotEmpty ? FileImage(File(imagePath)) : null,
            child: imagePath.isEmpty ? const Icon(Icons.person, size: 50, color: Colors.white) : null,
          ),
        ),
        // Add the uploadIcon
        uploadIcon,
      ],
    );
  }
}





/*

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalcollegeapp/common/widgets/appbar/appbar.dart';
import 'package:image_picker/image_picker.dart';
import '../controllers/profile_controller.dart';

class EditProfile extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());

  EditProfile({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GAppBar(
        title: Text('Edit Profile'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: 'avatarHero',
              child: Obx(() => CircularAvatar(
                imagePath: profileController.imagePath.value,
                onTap: () => _pickImage(context),
              )),
            ),
            const SizedBox(height: 16),
            _buildTextField('Contact Number', profileController.contactNumber),
            _buildTextField('Email', profileController.email),
            _buildTextField('Blood Group', profileController.bloodGroup),
            _buildTextField('Samara ID', profileController.samaraId),
            const SizedBox(height: 16),
            _buildLaptopSection(),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _showConfirmationDialog(context);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _saveProfile();
        },
        child: const Icon(Icons.save),
      ),
    );
  }

  Widget _buildTextField(String label, RxString controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
        ),
        controller: TextEditingController(text: controller.value),
        onChanged: (value) => controller.value = value,
      ),
    );
  }

  Widget _buildLaptopSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text('Do you have a Laptop?'),
            const SizedBox(width: 16),
            Obx(
                  () => Switch(
                value: profileController.hasLaptop.value,
                onChanged: (value) => profileController.toggleLaptop(value),
              ),
            ),
          ],
        ),
        Obx(() {
          if (profileController.hasLaptop.value) {
            return Column(
              children: [
                _buildTextField('Laptop Brand', profileController.laptopBrand),
                _buildTextField('Laptop RAM', profileController.laptopRam),
                _buildTextField('Laptop Processor', profileController.laptopProcessor),
                _buildTextField('Laptop Configuration', profileController.laptopConfig),
              ],
            );
          } else {
            return Container(); // Empty container when switch is off
          }
        }),
      ],
    );
  }

  Future<void> _pickImage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Image Source'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () async {
                  Navigator.of(context).pop(await picker.pickImage(source: ImageSource.gallery));
                },
                child: const Text('Gallery'),
              ),
              ElevatedButton(
                onPressed: () async {
                  Navigator.of(context).pop(await picker.pickImage(source: ImageSource.camera));
                },
                child: const Text('Camera'),
              ),
            ],
          ),
        );
      },
    );

    if (pickedFile != null) {
      profileController.imagePath.value = pickedFile.path;
    }
  }

  void _saveProfile() {
    // Perform save logic here
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Update Profile'),
          content: const Text('Do you really want to update your profile?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _updateProfileAndShowSnackbar();
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Get.back(); // Pop back to EditProfile
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }

  void _updateProfileAndShowSnackbar() {
    // Perform update logic here
    _saveProfile(); // Assuming this should save the profile

    // Show Snackbar
    Get.snackbar('Profile Updated', 'Your profile has been updated.');

    // Navigate back to the SettingsScreen
    Get.back(); // Assumes that you have a GetMaterialController associated with SettingsScreen
  }
}

class CircularAvatar extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;

  const CircularAvatar({super.key, required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 40,
        backgroundImage: imagePath.isNotEmpty ? FileImage(File(imagePath)) : null,
        child: imagePath.isEmpty ? const Icon(Icons.camera_alt) : null,
      ),
    );
  }
}


 */

