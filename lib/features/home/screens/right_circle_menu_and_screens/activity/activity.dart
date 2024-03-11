import 'package:flutter/material.dart';
import 'package:globalcollegeapp/utils/constants/colors.dart';
import '../../../../../common/widgets/appbar/appbar.dart';

class Activity extends StatelessWidget {
  const Activity({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: EColors.backgroundColor,
      appBar: GAppBar(
        backgroundColor: Colors.transparent,
        showBackArrow: true,
        title: Text('Activity'),
      ),

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [

            ///

          ],
        ),
      ),
    );
  }
}


