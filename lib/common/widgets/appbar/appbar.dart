import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../device/device_utility.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class GAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GAppBar({
    super.key,
    this.title,
    this.actions,
    this.leadingIcon,
    this.leadingOnPressed,
    this.showBackArrow = false,
    this.backgroundColor,
    this.centerTitle,
    this.bottom,
    this.flexibleSpace,
    this.surfaceTintColor,
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  final Color? backgroundColor;
  final bool? centerTitle;
  final TabBar? bottom;
  final Widget? flexibleSpace;
  final Color? surfaceTintColor;



  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);

    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: showBackArrow
          ? IconButton(onPressed: () => Get.back(), icon: const Icon(Iconsax.arrow_left), color: dark ?
      EColors.primary : EColors.primary,) : leadingIcon != null
              ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon)) : null,
      title: title,
      backgroundColor: backgroundColor,
      centerTitle: centerTitle,
      actions: actions,
        flexibleSpace: flexibleSpace,
        surfaceTintColor: surfaceTintColor,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(EDeviceUtils.getAppBarHeight());
}
