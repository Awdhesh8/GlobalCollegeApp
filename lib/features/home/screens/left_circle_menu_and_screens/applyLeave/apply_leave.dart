import 'package:flutter/material.dart';
import 'package:globalcollegeapp/common/widgets/appbar/appbar.dart';
import 'package:globalcollegeapp/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/texts/top_first_heading.dart';

class ApplyLeave extends StatelessWidget {
  const ApplyLeave({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime.now();
    return Scaffold(
      backgroundColor: EColors.backgroundColor,
      appBar: const GAppBar(
        backgroundColor: Colors.transparent,
        showBackArrow: true,
        title: Text(
          'Leave',
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'Inter',
            color: EColors.textColorPrimary1,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              /// Top Heading
              const TopHeading(
                text: 'Need Time Off?\nApply Now!',
              ),

              ///
              Container(

                child: ElevatedButton(
                  onPressed: () async {
                    final DateTime? dateTime = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2023),
                        lastDate: DateTime(2025));
                  },
                  child: Icon(Iconsax.calendar),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
