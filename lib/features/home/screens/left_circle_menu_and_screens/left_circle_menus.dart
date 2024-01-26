/*
import 'package:flutter/material.dart';
import 'dart:math';
import '../../../utils/constants/colors.dart';

class LeftSideCircularScrollingBoxes extends StatefulWidget {
  const LeftSideCircularScrollingBoxes({Key? key}) : super(key: key);

  @override
  _LeftSideCircularScrollingBoxesState createState() =>
      _LeftSideCircularScrollingBoxesState();
}

class _LeftSideCircularScrollingBoxesState
    extends State<LeftSideCircularScrollingBoxes> {
  final double circleRadius = 128.0; // Adjust the circle radius as needed
  final double boxWidth = 50.1; // Width of the scrolling boxes
  final double boxHeight = 90.5; // Height of the scrolling boxes
  late double _angle = 0.0; // Angle for box positioning and rotation
  // late double _startAngle = 0.0; // Initial angle for panning
  final double fontSize = 12.0; // Constant font size for text
  int selectedIndex = -1; // Track the currently selected index
  late double previousAngle = 0.0; // Previous angle for continuous rotation

  late List<bool> isSelected; // List to track selection

  final List<String> contentList = [
    'Name', 'sem', 'exam', 'college', 'sports',
    '1 sem', 'a', 'Career', 'Internship', 'Complaints',
    'Feedback', 'Placement', 'Career', 'Internship', 'Complaints',
    'Feedback', 'Placement', 'Career', 'Internship',
  ];

  @override
  void initState() {
    super.initState();
    isSelected = List.generate(contentList.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    int numberOfBoxes = contentList.length; // Number of boxes to be displayed
    double boxSeparationAngle =
        2 * pi / numberOfBoxes; // Angle between each box

    return Container(
      width: 180,
      height: 400,
      child: Stack(
        children: [
          GestureDetector(
            onPanStart: (details) {
              final touchPosition = details.localPosition;
              previousAngle = atan2(
                touchPosition.dy - 25 * 8,
                touchPosition.dx - 25 * 8,
              );
            },
            onPanUpdate: (details) {
              final touchPosition = details.localPosition;
              final currentAngle = atan2(
                touchPosition.dy - 25 * 8,
                touchPosition.dx - 25 * 8,
              );


              setState(() {
                double delta = currentAngle - previousAngle;
                if (delta.abs() > pi) {
                  delta -= delta > 0 ? -2 * pi : 2 * pi;
                }
                _angle += delta;
                previousAngle = currentAngle;
              });
            },
            child:

            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                // color: Colors.blue, // Change this to the desired color
              ),
              child: Stack(
                children: [
                  ...List.generate(numberOfBoxes, (index) {
                    double boxAngle = boxSeparationAngle * index;
                    double adjustedAngle = _angle - boxAngle;

                    String displayText = contentList[index];

                    return Positioned(
                      top: circleRadius * sin(adjustedAngle) -
                          (boxHeight / 2 - 20 * 9),
                      left: circleRadius * cos(adjustedAngle) -
                          (boxWidth / 2 + 5 * 4),
                      child: Transform.rotate(
                        angle: pi / 2,
                        child: Transform.rotate(
                          angle: adjustedAngle,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (selectedIndex == index) {
                                      selectedIndex = -1;
                                      isSelected[index] = false;
                                    } else {
                                      selectedIndex = index;
                                      isSelected = List.generate(
                                        contentList.length,
                                            (i) => i == index,
                                      );
                                    }
                                  });
                                },
                                child: Image.asset(
                                  isSelected[index]
                                      ? 'assets/images/red_rectangle.png'
                                      : 'assets/images/Rectangle_big.png',
                                  width: boxWidth + 4,
                                  height: boxHeight + 30,
                                  alignment: Alignment.center,
                                ),
                              ),
                              Positioned(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (selectedIndex == index) {
                                        selectedIndex = -1;
                                        isSelected[index] = false;
                                      } else {
                                        selectedIndex = index;
                                        isSelected = List.generate(
                                          contentList.length,
                                              (i) => i == index,
                                        );
                                      }
                                    });
                                  },
                                  child: Transform.rotate(
                                    angle: -pi / 2,
                                    child: Container(
                                      width: boxHeight,
                                      height: boxWidth,
                                      alignment: Alignment.center,
                                      child: Text(
                                        displayText,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: isSelected[index]
                                              ? EColors.white
                                              : EColors.textColorPrimary1,
                                          // ? EColors.textColorPrimary1
                                          //     : EColors.white,
                                          // : const Color.fromRGBO(16, 34, 130, 1),
                                          fontSize: fontSize,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

 */

import 'package:flutter/material.dart';
import 'dart:math';
import '../../../../routes_pages_navigation/named_routes_screens.dart';
import '../../../../utils/constants/colors.dart';
import 'package:get/get.dart';

import 'fees/fees_screen.dart';
import 'library/library_screen.dart';

class LeftSideCircularScrollingBoxes extends StatefulWidget {
  const LeftSideCircularScrollingBoxes({Key? key}) : super(key: key);

  @override
  _LeftSideCircularScrollingBoxesState createState() =>
      _LeftSideCircularScrollingBoxesState();
}

class _LeftSideCircularScrollingBoxesState
    extends State<LeftSideCircularScrollingBoxes> {
  final double circleRadius = 128.0;
  final double boxWidth = 50.1;
  final double boxHeight = 90.5;
  late double _angle = 0.0;
  final double fontSize = 12.0;
  int selectedIndex = -1;
  late double previousAngle = 0.0;
  late List<bool> isSelected;

  final List<String> contentListLeft = [
    'Fees',
    'Library',
    'Attendance',
    'Apply Leave',
    'Result',
    'Gate Pass',
    'Placement',
    'Career',
    'Internship',
    'Complaints',
    'Fees',
    'Library',
    'Attendance',
    'Apply Leave',
    'Result',
    'Feedback',
    'Career',
    'Internship',
    'Complaints',
  ];

  @override
  void initState() {
    super.initState();
    isSelected = List.generate(contentListLeft.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    int numberOfBoxes = contentListLeft.length;
    double boxSeparationAngle = 2 * pi / numberOfBoxes;

    return Container(
      width: 180,
      height: 400,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.diagonal3Values(-1, 1, 1), // Flip horizontally
        child: Stack(
          children: [
            GestureDetector(
              onPanStart: (details) {
                final touchPosition = details.localPosition;
                previousAngle = atan2(
                  touchPosition.dy - 25 * 8,
                  touchPosition.dx - 25 * 8,
                );
              },
              onPanUpdate: (details) {
                final touchPosition = details.localPosition;
                final currentAngle = atan2(
                  touchPosition.dy - 25 * 8,
                  touchPosition.dx - 25 * 8,
                );

                setState(() {
                  double delta = currentAngle - previousAngle;
                  if (delta.abs() > pi) {
                    delta -= delta > 0 ? -2 * pi : 2 * pi;
                  }
                  _angle += delta;
                  previousAngle = currentAngle;
                });
              },
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Stack(
                  children: List.generate(numberOfBoxes, (index) {
                    double boxAngle = boxSeparationAngle * index;
                    double adjustedAngle = _angle - boxAngle;

                    String displayText = contentListLeft[index];

                    return Positioned(
                      top: circleRadius * sin(adjustedAngle) -
                          (boxHeight / 2 - 20 * 9),
                      left: circleRadius * cos(adjustedAngle) -
                          (boxWidth / 2 - 13 * 12.1),
                      child: Transform.rotate(
                        angle: pi / 2,
                        child: Transform.rotate(
                          angle: adjustedAngle,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              GestureDetector(
                                onTap: () => _navigateToScreenLeftMenus(index),
                                child: Image.asset(
                                  isUnderDevelopmentLeftMenus(index)
                                      ? 'assets/images/disable_rectangle.png'
                                      : 'assets/images/Rectangle_big.png',
                                  // 'assets/images/Rectangle_big.png',
                                  width: boxWidth + 4,
                                  height: boxHeight + 30,
                                  alignment: Alignment.center,
                                ),
                              ),
                              Positioned(
                                child: GestureDetector(
                                  onTap: () => _navigateToScreenLeftMenus(index),
                                  child: Transform.rotate(
                                    angle:  pi/ 2,
                                    child: Transform(
                                      alignment: Alignment.center,
                                      transform: Matrix4.diagonal3Values(-1, 1, 1), // Flip horizontally
                                      child: Container(
                                        width: boxHeight,
                                        height: boxWidth,
                                        alignment: Alignment.center,
                                        child: Text(
                                          displayText,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            // color: isSelected[index]
                                            //     ? EColors.white
                                            //     : EColors.textColorPrimary1,
                                            color: EColors.textColorPrimary1,
                                            fontSize: fontSize,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToScreenLeftMenus(int index) {
    Widget Function() screen;
    switch (index) {
      case 0:
        screen = () => const FeesScreen();
        break;
      case 1:
        screen = () => const LibraryScreen();
        break;
    // Add cases for other indices/screens as needed
      default:
        _showSnackbar("It is in under Development");
        return;
    }

    Get.to(
      screen,
      transition: Transition.cupertino, // or Transition.zoom, Transition.leftToRight, etc.
      duration: const Duration(milliseconds: 500), // Optional: Specify the duration of the transition
    );


    setState(() {
      if (selectedIndex == index) {
        selectedIndex = -1;
        isSelected[index] = false;
      } else {
        selectedIndex = index;
        isSelected = List.generate(
          contentListLeft.length,
              (i) => i == index,
        );
      }
    });
  }

  void _showSnackbar(String message) {
    Get.snackbar(
      "Coming Soon...",
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.transparent,
      colorText: EColors.white,
    );
  }

  bool isUnderDevelopmentLeftMenus(int index) {
    // Add the indices of screens that are under development
    List<int> underDevelopmentIndices = [ 2 ,3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18];

    return underDevelopmentIndices.contains(index);
  }

}




/*
import 'package:flutter/material.dart';
import 'dart:math';
import '../../../../routes_pages_navigation/named_routes_screens.dart';
import '../../../../utils/constants/colors.dart';
import 'package:get/get.dart';

import 'fees/fees_screen.dart';
import 'library/library_screen.dart';

class LeftSideCircularScrollingBoxes extends StatefulWidget {
  const LeftSideCircularScrollingBoxes({Key? key}) : super(key: key);

  @override
  _LeftSideCircularScrollingBoxesState createState() =>
      _LeftSideCircularScrollingBoxesState();
}

class _LeftSideCircularScrollingBoxesState
    extends State<LeftSideCircularScrollingBoxes> {
  final double circleRadius = 128.0;
  final double boxWidth = 50.1;
  final double boxHeight = 90.5;
  late double _angle = 0.0;
  final double fontSize = 12.0;
  int selectedIndex = -1;
  late double previousAngle = 0.0;
  late List<bool> isSelected;

  final List<String> contentListLeft = [
    'Fees',
    'Library',
    'Attendance',
    'Apply Leave',
    'Result',
    'Gate Pass',
    'Placement',
    'Career',
    'Internship',
    'Complaints',
    'Fees',
    'Library',
    'Attendance',
    'Apply Leave',
    'Result',
    'Feedback',
    'Career',
    'Internship',
    'Complaints',
  ];

  @override
  void initState() {
    super.initState();
    isSelected = List.generate(contentListLeft.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    int numberOfBoxes = contentListLeft.length;
    double boxSeparationAngle = 2 * pi / numberOfBoxes;

    return Container(
      width: 180,
      height: 400,
      child: Stack(
        children: [
          GestureDetector(
            onPanStart: (details) {
              final touchPosition = details.localPosition;
              previousAngle = atan2(
                touchPosition.dy - 25 * 8,
                touchPosition.dx - 25 * 8,
              );
            },
            onPanUpdate: (details) {
              final touchPosition = details.localPosition;
              final currentAngle = atan2(
                touchPosition.dy - 25 * 8,
                touchPosition.dx - 25 * 8,
              );

              setState(() {
                double delta = currentAngle - previousAngle;
                if (delta.abs() > pi) {
                  delta -= delta > 0 ? -2 * pi : 2 * pi;
                }
                _angle += delta;
                previousAngle = currentAngle;
              });
            },
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Stack(
                children: List.generate(numberOfBoxes, (index) {
                  double boxAngle = boxSeparationAngle * index;
                  double adjustedAngle = _angle - boxAngle;

                  String displayText = contentListLeft[index];

                  return Positioned(
                    top: circleRadius * sin(adjustedAngle) -
                        (boxHeight / 2 - 20 * 9),
                    left: circleRadius * cos(adjustedAngle) -
                        (boxWidth / 2 + 5 * 4),
                    child: Transform.rotate(
                      angle: pi / 2,
                      child: Transform.rotate(
                        angle: adjustedAngle,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            GestureDetector(
                              onTap: () => _navigateToScreenLeftMenus(index),
                              child: Image.asset(
                                isUnderDevelopmentLeftMenus(index)
                                    ? 'assets/images/disable_rectangle.png'
                                    : 'assets/images/Rectangle_big.png',
                                // 'assets/images/Rectangle_big.png',
                                width: boxWidth + 4,
                                height: boxHeight + 30,
                                alignment: Alignment.center,
                              ),
                            ),
                            Positioned(
                              child: GestureDetector(
                                onTap: () => _navigateToScreenLeftMenus(index),
                                child: Transform.rotate(
                                  angle: -pi / 2,
                                  child: Container(
                                    width: boxHeight,
                                    height: boxWidth,
                                    alignment: Alignment.center,
                                    child: Text(
                                      displayText,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        // color: isSelected[index]
                                        //     ? EColors.white
                                        //     : EColors.textColorPrimary1,
                                        color: EColors.textColorPrimary1,
                                        fontSize: fontSize,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToScreenLeftMenus(int index) {
    Widget Function() screen;
    switch (index) {
      case 0:
        screen = () => const FeesScreen();
        break;
      case 1:
        screen = () => const LibraryScreen();
        break;
      // Add cases for other indices/screens as needed
      default:
        _showSnackbar("It is in under Development");
        return;
    }

    Get.to(
      screen,
      transition: Transition.cupertino, // or Transition.zoom, Transition.leftToRight, etc.
      duration: const Duration(milliseconds: 500), // Optional: Specify the duration of the transition
    );


    setState(() {
      if (selectedIndex == index) {
        selectedIndex = -1;
        isSelected[index] = false;
      } else {
        selectedIndex = index;
        isSelected = List.generate(
          contentListLeft.length,
          (i) => i == index,
        );
      }
    });
  }

  void _showSnackbar(String message) {
    Get.snackbar(
      "Coming Soon...",
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.transparent,
      colorText: EColors.white,
    );
  }

  bool isUnderDevelopmentLeftMenus(int index) {
    // Add the indices of screens that are under development
    List<int> underDevelopmentIndices = [ 2 ,3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18];

    return underDevelopmentIndices.contains(index);
  }

}


 */


