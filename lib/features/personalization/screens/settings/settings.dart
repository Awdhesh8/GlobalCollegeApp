import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalcollegeapp/features/personalization/screens/settings/widgets/education_details_tab.dart';
import 'package:globalcollegeapp/features/personalization/screens/settings/widgets/personal_details_tab.dart';
import 'package:globalcollegeapp/features/personalization/screens/settings/widgets/rounded_radio_buttons.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/profile_image_name/profile_header_name_image.dart';
import '../../../../controllers/user_controller_login_check/user_controller.dart';
import '../../../../data/api/api_services.dart';
import '../../../../utils/constants/colors.dart';
import '../../../authentication/screens/onboding/onboding_screen.dart';

class SettingsController extends GetxController {
  RxBool showPersonalDetails = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void showPersonalInfo() {
    showPersonalDetails.value = true;
  }

  void showEducationalInfo() {
    showPersonalDetails.value = false;
  }
}

class SettingsScreen extends StatelessWidget {
  final SettingsController controller = Get.put(SettingsController());
  final UserController userController = Get.find<UserController>(); // Add this line


  SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EColors.backgroundColor,
      appBar: const GAppBar(
        showBackArrow: false,
        title: Text(
          'Account',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: EColors.primary,
        centerTitle: true,
      ),
      body: Column(
        children: [

          /// --- Circular Avatar User Profile Image & Edit Button ---
          const UserProfile(
            userText: 'Surya Pratap Singh',
            imagePath: 'assets/images/user_icon.png',
            showEditButton: true, // or false
          ),


          /// Rounded Radio buttons To show the Information | Personal OR Educational
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Obx(() => RoundedButton(
                      label: 'Personal Info',
                      isSelected: controller.showPersonalDetails.value,
                      onPressed: () => controller.showPersonalInfo(),
                    )),
                Obx(() => RoundedButton(
                      label: 'Educational Info',
                      isSelected: !controller.showPersonalDetails.value,
                      onPressed: () => controller.showEducationalInfo(),
                    )),
              ],
            ),
          ),

          // /// Display Data according to the Selected Button
          // Expanded(
          //   child: Obx(() => controller.showPersonalDetails.value
          //       ? UserDetails(data: personalDetails)
          //       : EducationDetailsPanel(
          //           educationalDetails: educationalDetails,
          //         )),
          // ),
          //

          Expanded(
            child: FutureBuilder<Map<String, dynamic>?>(
              future: ApiService.getProfileData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return UserDetails(data: []);
                } else if (snapshot.hasError || snapshot.data == null) {
                  print('Error loading data: ${snapshot.error}');
                  return Center(child: Text('Error loading data'));
                } else {
                  final responseData = snapshot.data!;
                  print('API Response: $responseData');

                  // Check if 'data' key is present and not null
                  if (responseData.containsKey('response') && responseData['response'] != null) {
                    final dataList = responseData['response'] as List<dynamic>? ?? [];
                    return Obx(() => controller.showPersonalDetails.value
                        ? UserDetails(data: dataList.cast<Map<String, dynamic>>())
                        : EducationDetailsPanel(
                      educationalDetails: educationalDetails,
                    ));
                  } else {
                    print('Error: Missing or null "data" key in the API response.');
                    return Center(child: Text('Error loading data'));
                  }
                }
              },
            ),
          ),




          /*
          /// Display Data according to the Selected Button
          Expanded(
            child: FutureBuilder<Map<String, dynamic>?>(
              future: ApiService.getProfileData(),  // Use the ApiService to call getProfileData
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return UserDetails(data: {});
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error loading data'));
                } else {
                  return Obx(() => controller.showPersonalDetails.value
                      ? UserDetails(data: snapshot.data ?? {})
                      : EducationDetailsPanel(
                    educationalDetails: educationalDetails,
                  ));
                }
              },
            ),
          ),
           */


        ],
      ),


      /// Logout Button
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              // color: Color(0xFFFFC1C5),
              offset: Offset(-5, -5),
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
        child: Material(
          borderRadius: BorderRadius.circular(14.0),
          elevation: 8,
          color: EColors.primarySecond,
          child: InkWell(
            borderRadius: BorderRadius.circular(14.0),
            onTap: () {
              _showLogoutConfirmationDialog(context);
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.logout,
                    color: EColors.white,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 13,
                      color: EColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Do you really want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);

              // Perform the logout actions (e.g., clear user session)
              userController.logout();
              // Navigate to OnbodingScreen and close everything
              Get.offAll(() => const OnbodingScreen());
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}

