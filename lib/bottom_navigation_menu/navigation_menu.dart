import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalcollegeapp/features/time_table/time_table.dart';
import 'package:iconsax/iconsax.dart';
import '../features/authentication/screens/entryPoint/components/animated_bar.dart';
import '../features/home/screens/home_page.dart';
import '../features/notice/notice.dart';
import '../features/personalization/screens/settings/settings.dart';
import '../model/menu.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/colors.dart';
import '../utils/helpers/helper_functions.dart';
import 'package:rive/rive.dart'; // Import Rive package
import '../utils/rive/rive_utils.dart';

/*
class NavigationMenu extends StatelessWidget {
  const NavigationMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = EHelperFunctions.isDarkMode(context);

    final destinations = bottomNavItems.map((navBarItem) {
      return BtmNavItem(
        navBar: navBarItem,
        press: () {
          RiveUtils.changeSMIBoolState(navBarItem.rive.status!);
          controller.selectedIndex.value = bottomNavItems.indexOf(navBarItem);
        },
      );
    }).toList();

    return Scaffold(
      bottomNavigationBar: Obx(
            () => NavigationBar(
          height: 60,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
          controller.selectedIndex.value = index,
          backgroundColor:EColors.textPrimaryHeading,
          indicatorColor: EColors.white,
              // backgroundColor: darkMode ? EColors.black : EColors.bottomNavigationBar,
          // indicatorColor: darkMode
          //     ? EColors.white.withOpacity(0.1)
          //     : EColors.bottomNavigationBar.withOpacity(0.8),
          destinations: destinations,
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

class NavigationDestination {
  final Widget icon;
  final String label;

  NavigationDestination({
    required this.icon,
    required this.label,
  });
}

class BtmNavItem extends StatelessWidget {
  const BtmNavItem({
    Key? key,
    required this.navBar,
    required this.press,
  }) : super(key: key);

  final Menu navBar;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedBar(isActive: navBar == selectedBtmNav.value),
          SizedBox(
            height: 36,
            width: 36,
            child: Opacity(
              opacity: navBar == selectedBtmNav.value ? 1 : 0.5,
              child: RiveAnimation.asset(
                navBar.rive.src,
                artboard: navBar.rive.artboard,
                onInit: (artboard) {
                  navBar.rive.status = RiveUtils.getRiveInput(artboard, stateMachineName: navBar.rive.stateMachineName);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

 */


class NavigationMenu extends StatelessWidget {
  const NavigationMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    Color getIconColor(int index) {
      return controller.selectedIndex.value == index
          ? const Color(0xFFFE0037) // Selected icon color
          : Colors.white; // Unselected icon color
    }

    return Scaffold(
      bottomNavigationBar: Obx(
        () => CurvedNavigationBar(
          height: 60,
          index: controller.selectedIndex.value,
          onTap: (index) => controller.selectedIndex.value = index,
          backgroundColor: Colors.transparent,
          color:
              EColors.primary, // Background color for the selected icon
              // const Color(0xFFFE0037), // Background color for the selected icon
          buttonBackgroundColor:
              Colors.transparent, // Background color for the selected icon
          animationCurve: Curves.easeInOut, // Customize the animation curve
          animationDuration: const Duration(milliseconds: 500),
          items: [
            Icon(Iconsax.home, color: getIconColor(0)),
            Icon(Iconsax.calendar_add, color: getIconColor(1)),
            Icon(Iconsax.notification_favorite4, color: getIconColor(2)),
            Icon(Iconsax.user_edit, color: getIconColor(3)),
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
    Notice(),
    SettingsScreen(),
    // const SettingsScreen(),
  ];
}

/* /// Thi is working fine
class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key,});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = false; // Replace with your dark mode logic

    return Scaffold(
      bottomNavigationBar: Obx(
        () => ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: NavigationBar(
            height: 60,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            indicatorColor: EColors.primary, // No indicator
            backgroundColor: Colors.white,
            destinations: [
              NavigationDestination(
                icon: _buildIcon(Iconsax.home, 'Home', controller, 0),
                label: 'Home',
              ),
              NavigationDestination(
                icon: _buildIcon(
                    Iconsax.calendar_add, 'Time Table', controller, 1),
                label: 'Time Table',
              ),
              NavigationDestination(
                icon: _buildIcon(
                    Iconsax.notification_favorite4, 'Notice', controller, 2),
                label: 'Notice',
              ),
              NavigationDestination(
                icon: _buildIcon(Iconsax.user_edit, 'You', controller, 3),
                label: 'You',
              ),
            ],
          ),
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }

  Widget _buildIcon(
      IconData icon, String label, NavigationController controller, int index) {
    return Stack(
      children: [
        Icon(icon, color: const Color(0xFFFABEC0)), // Unselected color
        Positioned(
          top: -4,
          left: 0,
          child: Container(
            width: 4,
            height: 2,
            color: controller.selectedIndex.value == index
                ? const Color(0xFFFE0037) // Selected color
                : Colors.transparent,
          ),
        ),
      ],
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
*/

//
// class NavigationMenu extends StatelessWidget {
//   const NavigationMenu({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(NavigationController());
//      final darkMode = EHelperFunctions.isDarkMode(context);
//
//     return Scaffold(
//       bottomNavigationBar: Obx(
//         () => NavigationBar(
//           height: 60,
//           elevation: 0,
//           selectedIndex: controller.selectedIndex.value,
//           onDestinationSelected: (index) =>
//               controller.selectedIndex.value = index,
//           indicatorColor: EColors.primary,
//           // indicatorColor: const Color.fromRGBO(250, 170, 147, 100),
//           backgroundColor: Colors.white,
//           // backgroundColor: const Color.fromRGBO(250, 170, 147, 100),
//
//           // backgroundColor: darkMode ? EColors.black : EColors.white,
//           // indicatorColor: darkMode
//           //     ? EColors.white.withOpacity(0.1)
//           //     : EColors.bottomNavigationBar.withOpacity(0.8),
//
//           destinations: const [
//             NavigationDestination(icon: Icon(Iconsax.home,), label: 'Home'),
//             NavigationDestination(icon: Icon(Iconsax.calendar_add), label: 'Time Table'),
//             NavigationDestination(icon: Icon(Iconsax.notification_favorite4), label: 'Notice'),
//             NavigationDestination(icon: Icon(Iconsax.user_edit), label: 'You'),
//           ],
//         ),
//       ),
//       body: Obx(() => controller.screens[controller.selectedIndex.value]),
//     );
//   }
// }
//
// class NavigationController extends GetxController {
//   final Rx<int> selectedIndex = 0.obs;
//
//   final screens = [
//     const MyHomePage(),
//     const TimeTable(),
//     const Notice(),
//    const SettingsScreen(),
//   ];
// }
