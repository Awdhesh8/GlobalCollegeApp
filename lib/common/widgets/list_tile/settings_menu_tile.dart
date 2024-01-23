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
    return ListTile(
      // leading: Icon(icon, size: 28, color: EColors.primary,),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium,),
      subtitle: Text(subTitle, style: Theme.of(context).textTheme.labelSmall,),
      // trailing: const Icon(Iconsax.arrow_right_3, size: 20),
      onTap: onTap,
    );
  }
}
