import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalcollegeapp/features/home/screens/left_circle_menu_and_screens/fees/fees_screen.dart';
import 'package:globalcollegeapp/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../utils/constants/colors.dart';

class FeesCard extends StatelessWidget {
  const FeesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
      child: Container(
        width: double.infinity,
        decoration: ShapeDecoration(
          color: EColors.backgroundColor,
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
        child: Column(
          children: [
            /// Commitment Text
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                          color: EColors.circleAvatar,
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Commitment : 20000+ Scholarship Per Year',
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: EColors.textColorPrimary1,
                                  fontSize: 13,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: ESizes.spaceBtwItems,),

            /// Balance Fees & Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                          color: EColors.primarySecond,
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Balance Fees  ( 7 Semester )',
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: EColors.white,
                                  fontSize: 13,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: ESizes.spaceBtwItems,),

            const Row(
              children: [
                Text(
                  '1,10,159',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: ESizes.spaceBtwItems,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color(0xFF9D0D11),
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(12), bottomLeft: Radius.circular(12),)),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () =>
                              Get.to(
                                const FeesScreen(),
                                transition: Transition.cupertino,
                                duration: const Duration(milliseconds: 500),
                              ),

                            child: const Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Text(
                                'View Details',
                                style: TextStyle(
                                  color: EColors.white,
                                  fontSize: 12,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                ),

                              ),
                            ),
                          ),
                          const Icon(Iconsax.arrow_right_14, color: Colors.white, size: 18,),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
