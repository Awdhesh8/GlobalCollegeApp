import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalcollegeapp/features/time_table/time_table.dart';
import 'package:iconsax/iconsax.dart';
import '../features/home/screens/home_page.dart';
import '../features/notice/notice.dart';
import '../features/personalization/screens/settings/settings.dart';
import '../utils/constants/colors.dart';
import '../utils/helpers/helper_functions.dart';


class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
     final darkMode = EHelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 60,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          // indicatorColor: const Color.fromRGBO(250, 170, 147, 100),
          // backgroundColor: const Color.fromRGBO(250, 170, 147, 100),

          backgroundColor: darkMode ? EColors.black : EColors.white,
          indicatorColor: darkMode
              ? EColors.white.withOpacity(0.1)
              : EColors.bottomNavigationBar.withOpacity(0.8),

          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.calendar_add), label: 'Time Table'),
            NavigationDestination(icon: Icon(Iconsax.notification_favorite4), label: 'Notice'),
            NavigationDestination(icon: Icon(Iconsax.user_edit), label: 'You'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const MyHomePage(),
    const TimeTable(),
    const Notice(),
   const SettingsScreen(),
  ];
}
