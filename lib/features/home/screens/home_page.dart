import 'package:flutter/material.dart';
import 'package:globalcollegeapp/common/widgets/appbar/appbar.dart';
import 'package:globalcollegeapp/features/home/screens/profile_card/profile_box.dart';
import 'package:globalcollegeapp/utils/constants/colors.dart';
import '../../../Circular Menus/circular_menus_with_circle.dart';
import 'left_circle_menu_and_screens/fees/fees_contanier/fees_container.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EColors.backgroundColor,
      appBar: GAppBar(
        showBackArrow: false,
        title: Image.asset(
          'assets/logo/global_college_logo.png',
          width: 105,
        ),
        backgroundColor: EColors.primary,
        centerTitle: true,
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            const CircularMenuWithCircle(),
            const ProfileBox(),
            // FeesContainer(),
          ],
        ),
      ),
    );
  }
}

