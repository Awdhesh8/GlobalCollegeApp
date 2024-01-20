import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
/*
class ProfileBox extends StatefulWidget {
  const ProfileBox({super.key});

  @override
  State<ProfileBox> createState() => _ProfileBoxState();
}

class _ProfileBoxState extends State<ProfileBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: ShapeDecoration(
        color: EColors.primary,
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
                  radius: 70,
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
                          'Surya Pratap Singh',
                          style: TextStyle(
                            color: EColors.white,
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
                      color: EColors.white,
                      fontSize: 13,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text('Sem: 2nd sem',
                    style: TextStyle(
                      color: EColors.white,
                      fontSize: 13,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text('Branch: Computer Science',
                    style: TextStyle(
                      color: EColors.white,
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
 */

import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class ProfileBox extends StatefulWidget {
  const ProfileBox({Key? key}) : super(key: key);

  @override
  State<ProfileBox> createState() => _ProfileBoxState();
}

class _ProfileBoxState extends State<ProfileBox> {
  @override
  Widget build(BuildContext context) {
    return FlipCard(
      direction: FlipDirection.HORIZONTAL, // Set the flip direction
      flipOnTouch: true,
      front: buildFront(),
      back: buildBack(),
    );
  }

  Widget buildFront() {
    double containerWidth = MediaQuery.of(context).size.width * 0.7;

    return Stack(
      children: [
        // Card content
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 100,
              width: containerWidth,
              margin: const EdgeInsets.all(20),
              decoration: ShapeDecoration(
                color: EColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x26000000),
                    blurRadius: 10.90,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: const Padding(
                padding: EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(),
                    Expanded(
                      child: Text(
                        'Surya Pratap Singh',
                        style: TextStyle(
                          color: EColors.white,
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const Positioned(
          left: 12,
          top: 2,
          child: CircleAvatar(
            radius: 65,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage('assets/avaters/Avatar 6.jpg'),
          ),
        ),
        // Small container with text
        Positioned(
          bottom: 20,
          right: 20,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: EColors.primarySecond,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: const Text(
              'Tap to see more',
              style: TextStyle(
                color: EColors.white,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }


  // Widget buildFront() {
  //   return Stack(
  //     children: [
  //       // Card content
  //       Container(
  //         margin: const EdgeInsets.all(15),
  //         decoration: ShapeDecoration(
  //           color: EColors.primary,
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(20),
  //           ),
  //           shadows: const [
  //             BoxShadow(
  //               color: Color(0x26000000),
  //               blurRadius: 10.90,
  //               offset: Offset(0, 0),
  //               spreadRadius: 0,
  //             ),
  //           ],
  //         ),
  //         child: Padding(
  //           padding: const EdgeInsets.all(14),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               // Circle background
  //               Container(
  //                 width: 60,
  //                 height: 60,
  //                 decoration: const BoxDecoration(
  //                   shape: BoxShape.circle,
  //                   color: EColors.softGrey,
  //                 ),
  //                 child: const SizedBox(), // Empty SizedBox as a placeholder
  //               ),
  //               Column(
  //                 children: [
  //                   // CircleAvatar on the circle
  //                   CircleAvatar(
  //                     radius: 70,
  //                     backgroundColor: EColors.softGrey,
  //                   ),
  //                 ],
  //               ),
  //               SizedBox(width: ESizes.spaceBtwItems,),
  //               Expanded(
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Row(
  //                       children: [
  //                         Flexible(
  //                           child: Text(
  //                             'Surya Pratap Singh',
  //                             style: TextStyle(
  //                               color: EColors.white,
  //                               fontSize: 18,
  //                               fontFamily: 'Inter',
  //                               fontWeight: FontWeight.w600,
  //                             ),
  //                             maxLines: 2,
  //                             overflow: TextOverflow.ellipsis,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                     SizedBox(height: ESizes.spaceBtwItemsHeadings),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
  Widget buildBack() {
    // customize the back side of the card here
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: ShapeDecoration(
        color: EColors.primary,
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
            // Column(
            //   children: [
            //     CircleAvatar(
            //       radius: 70,
            //       backgroundColor: EColors.softGrey,
            //     ),
            //   ],
            // ),
            SizedBox(
              width: ESizes.spaceBtwItems,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          'Surya Pratap Singh',
                          style: TextStyle(
                            color: EColors.white,
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
                  Text(
                    'E no:  1201ME2024',
                    style: TextStyle(
                      color: EColors.white,
                      fontSize: 13,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'Sem: 2nd sem',
                    style: TextStyle(
                      color: EColors.white,
                      fontSize: 13,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'Branch: Computer Science',
                    style: TextStyle(
                      color: EColors.white,
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

// class ProfileBox extends StatefulWidget {
//   const ProfileBox({super.key});
//
//   @override
//   State<ProfileBox> createState() => _ProfileBoxState();
// }
//
// class _ProfileBoxState extends State<ProfileBox> {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 5,
//       margin: EdgeInsets.all(1),
//       color: EColors.primary,
//       shape: CircleBorder(),
//       // decoration: ShapeDecoration(
//       //   color: EColors.primary,
//       //   shape: RoundedRectangleBorder(
//       //     borderRadius: BorderRadius.circular(20),
//       //   ),
//       //   shadows: const [
//       //     BoxShadow(
//       //       color: Color(0x26000000),
//       //       blurRadius: 10.90,
//       //       offset: Offset(0, 0),
//       //       spreadRadius: 0,
//       //     )
//       //   ],
//       // ),
//       child: const Padding(
//         padding: EdgeInsets.all(14),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Column(
//               children: [
//                 CircleAvatar(
//                   radius: 70,
//                   backgroundColor: EColors.softGrey,
//                 ),
//               ],
//             ),
//             SizedBox(width: ESizes.spaceBtwItems,),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       Flexible(
//                         child: Text(
//                           'Surya Pratap Singh',
//                           style: TextStyle(
//                             color: EColors.white,
//                             fontSize: 18,
//                             fontFamily: 'Inter',
//                             fontWeight: FontWeight.w600,
//                           ),
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: ESizes.spaceBtwItemsHeadings),
//                   Text('E no:  1201ME2024',
//                     style: TextStyle(
//                       color: EColors.white,
//                       fontSize: 13,
//                       fontFamily: 'Inter',
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                   Text('Sem: 2nd sem',
//                     style: TextStyle(
//                       color: EColors.white,
//                       fontSize: 13,
//                       fontFamily: 'Inter',
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                   Text('Branch: Computer Science',
//                     style: TextStyle(
//                       color: EColors.white,
//                       fontSize: 13,
//                       fontFamily: 'Inter',
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
