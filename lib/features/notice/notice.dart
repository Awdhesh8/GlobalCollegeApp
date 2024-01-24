import 'package:flutter/material.dart';
import '../../common/widgets/appbar/appbar.dart';
import '../../common/widgets/texts/top_first_heading.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../personalization/screens/settings/settings.dart';

class Notice extends StatefulWidget {
  const Notice({Key? key}) : super(key: key);

  @override
  _NoticeState createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EColors.backgroundColor,
      /// App Bar
      appBar: const GAppBar(
        backgroundColor: Colors.transparent,
        showBackArrow: false,
        title: Text(
          'Notice',
          style: TextStyle(
              fontSize: ESizes.appTitle,
              color: EColors.textPrimaryHeading,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
      ),

      /// Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [

              /// Notification Card For Text only

              Container(
                // width: 373,
                // height: 179,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x26000000),
                      blurRadius: 10.90,
                      offset: Offset(0, 0),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Notification Heading',
                                    style: TextStyle(
                                      color: EColors.textPrimaryHeading,
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: ESizes.spaceBtwItemsHeadings,),
                              Text(
                                'Description: Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity.',
                                style: TextStyle(
                                  color: EColors.textSecondaryTitle,
                                  fontSize: 12,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                ),

                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        '14 Jan 2024\n11:45 AM',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFF686868),
                          fontSize: 8,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}



