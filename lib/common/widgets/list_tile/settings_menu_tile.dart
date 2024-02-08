import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';

class ESettingsMenuTile extends StatelessWidget {
  const ESettingsMenuTile({super.key,
    this.icon,
    required this.title,
    required this.subTitle,
    this.trailing,
    this.onTap
  });

  final IconData? icon;
  final String title, subTitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFE0E5),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFFFFC1C5),
              offset: Offset(-2, -2),
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
        child: ListTile(
          leading: Icon(icon, size: 28, color: EColors.primary,),
          title: Text(title, style: Theme.of(context).textTheme.titleMedium,),
          subtitle: Text(subTitle, style: Theme.of(context).textTheme.labelSmall,),
          // trailing: const Icon(Iconsax.arrow_right_3, size: 20),
          onTap: onTap,
        ),
      ),
    );
  }
}
