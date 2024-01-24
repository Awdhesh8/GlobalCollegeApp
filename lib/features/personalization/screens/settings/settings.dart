import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalcollegeapp/features/personalization/screens/settings/widgets/education_details_tab.dart';
import 'package:globalcollegeapp/features/personalization/screens/settings/widgets/personal_details_tab.dart';
import 'package:globalcollegeapp/features/personalization/screens/settings/widgets/rounded_radio_buttons.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/texts/top_first_heading.dart';
import '../../../../utils/constants/colors.dart';
import 'edit_profile/edit_Profile.dart';


class SettingsController extends GetxController {
  RxBool showPersonalDetails = true.obs;
  RxList<bool> isExpandedList = List.generate(educationalDetails.length, (index) => false).obs;

  @override
  void onInit() {
    super.onInit();
  }

  void toggleExpansion(int panelIndex, bool isExpanded) {
    isExpandedList[panelIndex] = !isExpanded;
    update(); // Trigger UI update
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// User Name
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Row(
              children: [
                TopHeading(
                  text: 'Hello,',
                  fontSize: 20,
                ),
                Text(' Surya Pratap Singh', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),

          /// --- Circular Avatar User Profile Image & Edit Button ---
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10,right: 20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [

                /// User Profile Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    'assets/images/user_icon.png',
                    fit: BoxFit.cover,
                    width: 80,
                    height: 80,
                  ),
                ),

                /// Edit Information Button.
                Column(
                  children: [
                    TextButton(onPressed: () {Get.to(() => EditProfile(),
                      transition: Transition.rightToLeftWithFade, // You can choose the desired transition here
                      duration: const Duration(milliseconds: 300), // Optional: Set the duration of the transition
                    ); },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Edit Profile'),
                          SizedBox(width: 4,),
                          Icon(Iconsax.edit)
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
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

          /// Display Data according to the Selected Button
          Expanded(
            child: Obx(() => controller.showPersonalDetails.value
                ? UserDetails(data: personalDetails)
                : EducationDetailsPanel(
              educationalDetails: educationalDetails,
              isExpandedList: controller.isExpandedList,
              onExpansionChanged: (index, isExpanded) =>
                  controller.toggleExpansion(index, isExpanded),
            )),
          ),

          /// Logout Button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle logout logic here
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(EColors.primary), // Adjust color as needed
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 36),
                    child: Text(
                      'Logout',
                      style: TextStyle(
                        fontSize: 16,
                        color: EColors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),


        ],
      ),
    );
  }
}





