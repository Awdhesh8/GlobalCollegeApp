import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../features/authentication/screens/entryPoint/components/animated_bar.dart';
import '../features/home/screens/home_page.dart';
import '../features/notice/notice.dart';
import '../features/personalization/screens/settings/settings.dart';
import '../features/time_table/time_table.dart';
import '../model/menu.dart';
import '../utils/constants/colors.dart';
import '../utils/helpers/helper_functions.dart';
import 'package:rive/rive.dart'; // Import Rive package
import '../utils/rive/rive_utils.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationController>(
      init: NavigationController(),
      builder: (controller) {
        Color getIconColor(int index) {
          return controller.selectedIndex.value == index
              ? const Color(0xFFFE0037) // Selected icon color
              : Colors.white; // Unselected icon color
        }

        return WillPopScope(
          onWillPop: () async {
            return await _onBackPressed(context);
          },
          child: Scaffold(
            bottomNavigationBar: Obx(
              () => CurvedNavigationBar(
                height: 60,
                index: controller.selectedIndex.value,
                onTap: (index) => controller.selectedIndex.value = index,
                backgroundColor: Colors.transparent,
                color: EColors.primary,
                buttonBackgroundColor: Colors.transparent,
                animationCurve: Curves.easeInOut,
                animationDuration: const Duration(milliseconds: 500),
                items: [
                  Icon(Iconsax.home, color: getIconColor(0)),
                  Icon(Iconsax.calendar_add, color: getIconColor(1)),
                  Icon(Iconsax.notification_favorite, color: getIconColor(2)),
                  Icon(Iconsax.user, color: getIconColor(3)),
                ],
              ),
            ),
            body: Obx(() => controller.screens[controller.selectedIndex.value]),
          ),
        );
      },
    );
  }

  Future<bool> _onBackPressed(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Exit App?'),
        content: const Text('Do you really want to exit?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);

              // Close the app using exit(0)
              exit(0);
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    ) ?? false;
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const MyHomePage(),
    TimeTable(),
    const Notice(),
    // ProfileScreen(),
    SettingsScreen(),
  ];
}


