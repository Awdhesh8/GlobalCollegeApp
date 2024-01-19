import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class ProfileBox extends StatefulWidget {
  const ProfileBox({super.key});

  @override
  State<ProfileBox> createState() => _ProfileBoxState();
}

class _ProfileBoxState extends State<ProfileBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
        padding: EdgeInsets.all(14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: EColors.softGrey,
                ),
              ],
            ),
            SizedBox(width: ESizes.spaceBtwItems,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          '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',
                          style: TextStyle(
                            color: EColors.textPrimaryHeading,
                            fontSize: 18,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: ESizes.spaceBtwItemsHeadings),
                  Text('E no:  1201ME2024',
                    style: TextStyle(
                      color: EColors.textSecondaryTitle,
                      fontSize: 13,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text('Sem: 2nd sem',
                    style: TextStyle(
                      color: EColors.textSecondaryTitle,
                      fontSize: 13,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text('Branch: Computer Science',
                    style: TextStyle(
                      color: EColors.textSecondaryTitle,
                      fontSize: 13,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                '',
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
                            '',
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
                    '',
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
 */
