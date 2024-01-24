import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalcollegeapp/common/widgets/appbar/appbar.dart';
import 'package:image_picker/image_picker.dart';
import '../controllers/profile_controller.dart';

class EditProfile extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());

  EditProfile({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GAppBar(
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
              child: CircularAvatar(
                imagePath: profileController.imagePath.value,
                onTap: () => _pickImage(context),
              ),
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
              onPressed: _saveProfile,
              child: const Text('Save'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _saveProfile();
          Get.snackbar('Profile Updated', 'Your profile has been updated.');
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
        if (profileController.hasLaptop.value) ...[
          _buildTextField('Laptop Brand', profileController.laptopBrand),
          _buildTextField('Laptop RAM', profileController.laptopRam),
          _buildTextField('Laptop Processor', profileController.laptopProcessor),
          _buildTextField('Laptop Configuration', profileController.laptopConfig),
        ],
      ],
    );
  }

  Future<void> _pickImage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      profileController.imagePath.value = pickedFile.path;
    }
  }
  void _saveProfile() {
    // Perform save logic here
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
