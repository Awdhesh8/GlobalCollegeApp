import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:globalcollegeapp/common/widgets/continue_border_Deco_rectangle/continue_border_rectangle.dart';
import 'package:globalcollegeapp/features/home/screens/left_circle_menu_and_screens/result/widget/animation.dart';

class ExamDetailsController extends GetxController {
  var selectedTabIndex = 0.obs;

  void changeTabIndex(int index) {
    selectedTabIndex.value = index;
  }
}

class ExamDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> semester;
  final String examType;

  ExamDetailsScreen(this.semester, this.examType);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ExamDetailsController());

    Map<String, dynamic> examData;

    if (examType == 'Final Exam') {
      examData = semester['final_exam'];
    } else {
      examData = semester['mid_term_exam'];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('$examType Details'),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Vertical tabs
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
            ),
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return Obx(() {
                  return GestureDetector(
                    onTap: () {
                      controller.changeTabIndex(index);
                      // Add animation here
                      Get.to(
                            () => ExamDetailsScreen(
                          semester,
                          examType,
                        ),
                        transition: Transition.rightToLeft,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: TabItem(
                      text: index == 0 ? 'Theoretical' : 'Practical',
                      isSelected: controller.selectedTabIndex.value == index,
                    ),
                  );
                });
              },
            ),
          ),
          // Details section
          Expanded(
            child: Container(
              padding: EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${examType.toUpperCase()} DETAILS',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: Obx(() {
                      return getContentForTab(examData, controller);
                    }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getContentForTab(
      Map<String, dynamic> examData, ExamDetailsController controller) {
    switch (controller.selectedTabIndex.value) {
      case 0:
        return TheoreticalContent(examData: examData);
      case 1:
        return PracticalContent(examData: examData);
      default:
        return Container();
    }
  }
}

class TabItem extends StatelessWidget {
  final String text;
  final bool isSelected;

  const TabItem({
    required this.text,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.transparent,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: RotatedBox(
        quarterTurns: -1,
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}

class AnimatedText extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;

  const AnimatedText({
    this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: -1.0, end: 0.0), // Start from off-screen (-1.0) to original position (0.0)
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(value * -100, 0.0), // Translate horizontally based on value
          // offset: Offset(0.0, value * 100), // Translate vertically based on value
          child: Opacity(
            opacity: 1 + value, // Adjust opacity based on value to fade in
            child: child,
          ),
        );
      },
      child: Text(
        text!,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
    );
  }
}
class AnimatedContainer extends StatelessWidget {
  final Widget child;

  AnimatedContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: -1.0, end: 0.0),
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(value * -100, 0.0),
          child: Opacity(
            opacity: 1 + value,
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}

class TheoreticalContent extends StatelessWidget {
  final Map<String, dynamic> examData;
  final CustomAnimationController animationController =
  Get.put(CustomAnimationController());
  TheoreticalContent({required this.examData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedContainer(
         child: Container(
           decoration: CustomDeco.decoRectangle(),
           width: double.infinity,
           padding: EdgeInsets.all(15),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               AnimatedText(
                 text: 'Result: ${examData["result"] ?? "NA"}',
                 fontSize: 18.0,
                 fontWeight: FontWeight.normal,
                 color: Colors.black,
               ),
               SizedBox(height: 8.0),
               AnimatedText(
                 text:
                 'SGPA: ${examData["theoretical_result"]["current_semester_sgpa"] ?? "NA"}',
                 fontSize: 18.0,
                 fontWeight: FontWeight.normal,
                 color: Colors.black,
               ),
             ],
           ),
         ),
       ),
          SizedBox(height: 8.0),
          AnimatedContainer(
           child: Container(
             decoration: CustomDeco.decoRectangle(),
             width: double.infinity,
             padding: EdgeInsets.all(15),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
               AnimatedText(
                 text: 'Subjects:',
                 fontSize: 18.0,
                 fontWeight: FontWeight.bold,
                 color: Colors.black,
               ),
               SizedBox(height: 8.0),
               if (examData["theoretical_result"]["subjects"] != null)
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     for (var subject in examData["theoretical_result"]["subjects"])
                       Padding(
                         padding: const EdgeInsets.symmetric(vertical: 4.0),
                         child: Row(
                           children: [
                             Icon(
                               FontAwesomeIcons.book,
                               size: 16.0,
                               color: Colors.black,
                             ),
                             SizedBox(width: 8.0),
                             Expanded(
                               child: AnimatedText(
                                 text:
                                 '${subject["name"]}: ${subject["grade"]} (${subject["status"]})',
                                 fontSize: 16.0,
                                 fontWeight: FontWeight.normal,
                                 color: Colors.black,
                               ),
                             ),
                           ],
                         ),
                       ),
                   ],
                 ),
             ],),
           ),
         ),
        ],
      ),
    );
  }
}

class PracticalContent extends StatelessWidget {
  final Map<String, dynamic> examData;

  PracticalContent({required this.examData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedContainer(
         child: Container(
           decoration: CustomDeco.decoRectangle(),
           width: double.infinity,
           padding: EdgeInsets.all(15),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               AnimatedText(
                 text:
                 'Practical Result: ${examData["practical_result"]["result"] ?? "NA"}',
                 fontSize: 18.0,
                 fontWeight: FontWeight.normal,
                 color: Colors.black,
               ),
               SizedBox(height: 8.0),
               AnimatedText(
                 text:
                 'SGPA: ${examData["practical_result"]["current_semester_sgpa"] ?? "NA"}',
                 fontSize: 18.0,
                 fontWeight: FontWeight.normal,
                 color: Colors.black,
               ),
             ],
           ),
         ),
       ),
        SizedBox(height: 8.0),
        AnimatedContainer(
          child: Container(
            decoration: CustomDeco.decoRectangle(),
            width: double.infinity,
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedText(
                  text: 'Practical Subjects:',
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                SizedBox(height: 8.0),
                if (examData["practical_result"]["subjects"] != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var subject in examData["practical_result"]["subjects"])
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.tools,
                                size: 16.0,
                                color: Colors.black,
                              ),
                              SizedBox(width: 8.0),
                              Expanded(
                                child: AnimatedText(
                                  text: '${subject["name"]}: ${subject["status"]}',
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}



/// Correct code with the animation on the Text
/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExamDetailsController extends GetxController {
  var selectedTabIndex = 0.obs;

  void changeTabIndex(int index) {
    selectedTabIndex.value = index;
  }
}

class ExamDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> semester;
  final String examType;

  ExamDetailsScreen(this.semester, this.examType);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ExamDetailsController());

    Map<String, dynamic> examData;

    if (examType == 'Final Exam') {
      examData = semester['final_exam'];
    } else {
      examData = semester['mid_term_exam'];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('$examType Details'),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Vertical tabs
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
            ),
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return Obx(() {
                  return GestureDetector(
                    onTap: () {
                      controller.changeTabIndex(index);
                      // Add animation here
                      Get.to(
                            () => ExamDetailsScreen(
                          semester,
                          examType,
                        ),
                        transition: Transition.rightToLeft,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: TabItem(
                      text: index == 0 ? 'Theoretical' : 'Practical',
                      isSelected: controller.selectedTabIndex.value == index,
                    ),
                  );
                });
              },
            ),
          ),
          // Details section
          Expanded(
            child: Container(
              padding: EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${examType.toUpperCase()} DETAILS',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: Obx(() {
                      return getContentForTab(examData, controller);
                    }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getContentForTab(
      Map<String, dynamic> examData, ExamDetailsController controller) {
    switch (controller.selectedTabIndex.value) {
      case 0:
        return TheoreticalContent(examData: examData);
      case 1:
        return PracticalContent(examData: examData);
      default:
        return Container();
    }
  }
}

class TabItem extends StatelessWidget {
  final String text;
  final bool isSelected;

  const TabItem({
    required this.text,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.transparent,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: RotatedBox(
        quarterTurns: -1,
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}

class AnimatedText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  const AnimatedText({
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
    );
  }
}

class TheoreticalContent extends StatelessWidget {
  final Map<String, dynamic> examData;

  TheoreticalContent({required this.examData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedText(
          text: 'Result: ${examData["result"] ?? "NA"}',
          fontSize: 18.0,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
        SizedBox(height: 8.0),
        AnimatedText(
          text:
          'SGPA: ${examData["theoretical_result"]["current_semester_sgpa"] ?? "NA"}',
          fontSize: 18.0,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
        SizedBox(height: 8.0),
        AnimatedText(
          text: 'Subjects:',
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        SizedBox(height: 8.0),
        if (examData["theoretical_result"]["subjects"] != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var subject in examData["theoretical_result"]["subjects"])
                AnimatedText(
                  text:
                  '${subject["name"]}: ${subject["grade"]} (${subject["status"]})',
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
            ],
          ),
      ],
    );
  }
}

class PracticalContent extends StatelessWidget {
  final Map<String, dynamic> examData;

  PracticalContent({required this.examData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedText(
          text:
          'Practical Result: ${examData["practical_result"]["result"] ?? "NA"}',
          fontSize: 18.0,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
        SizedBox(height: 8.0),
        AnimatedText(
          text:
          'SGPA: ${examData["practical_result"]["current_semester_sgpa"] ?? "NA"}',
          fontSize: 18.0,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
        SizedBox(height: 8.0),
        AnimatedText(
          text: 'Practical Subjects:',
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        SizedBox(height: 8.0),
        if (examData["practical_result"]["subjects"] != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var subject in examData["practical_result"]["subjects"])
                AnimatedText(
                  text: '${subject["name"]}: ${subject["status"]}',
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
            ],
          ),
      ],
    );
  }
}

 */



/// Correct UI vertical Tabbar
/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExamDetailsController extends GetxController {
  var selectedTabIndex = 0.obs;

  void changeTabIndex(int index) {
    selectedTabIndex.value = index;
  }
}

class ExamDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> semester;
  final String examType;

  ExamDetailsScreen(this.semester, this.examType);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ExamDetailsController());

    Map<String, dynamic> examData;

    if (examType == 'Final Exam') {
      examData = semester['final_exam'];
    } else {
      examData = semester['mid_term_exam'];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('$examType Details'),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Vertical tabs
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
            ),
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return Obx(() {
                  return TabItem(
                    text: index == 0 ? 'Theoretical' : 'Practical',
                    isSelected: controller.selectedTabIndex.value == index,
                    onTap: () => controller.changeTabIndex(index),
                  );
                });
              },
            ),
          ),
          // Details section
          Expanded(
            child: Container(
              padding: EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${examType.toUpperCase()} DETAILS',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: Obx(() {
                      return getContentForTab(examData, controller);
                    }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getContentForTab(
      Map<String, dynamic> examData, ExamDetailsController controller) {
    switch (controller.selectedTabIndex.value) {
      case 0:
        return TheoreticalContent(examData: examData);
      case 1:
        return PracticalContent(examData: examData);
      default:
        return Container();
    }
  }
}


class TabItem extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function onTap;

  const TabItem({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
        ),
        child: RotatedBox(
          quarterTurns: -1,
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}

class TheoreticalContent extends StatelessWidget {
  final Map<String, dynamic> examData;

  TheoreticalContent({required this.examData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Result: ${examData["result"] ?? "NA"}',
          style: TextStyle(fontSize: 18.0),
        ),
        SizedBox(height: 8.0),
        Text(
          'SGPA: ${examData["theoretical_result"]["current_semester_sgpa"] ?? "NA"}',
          style: TextStyle(fontSize: 18.0),
        ),
        SizedBox(height: 8.0),
        Text(
          'Subjects:',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        if (examData["theoretical_result"]["subjects"] != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var subject in examData["theoretical_result"]["subjects"])
                ListTile(
                  title: Text(
                    '${subject["name"]}: ${subject["grade"]} (${subject["status"]})',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  dense: true,
                  contentPadding: EdgeInsets.all(0),
                ),
            ],
          ),
      ],
    );
  }
}

class PracticalContent extends StatelessWidget {
  final Map<String, dynamic> examData;

  PracticalContent({required this.examData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Practical Result: ${examData["practical_result"]["result"] ?? "NA"}',
          style: TextStyle(fontSize: 18.0),
        ),
        SizedBox(height: 8.0),
        Text(
          'SGPA: ${examData["practical_result"]["current_semester_sgpa"] ?? "NA"}',
          style: TextStyle(fontSize: 18.0),
        ),
        SizedBox(height: 8.0),
        Text(
          'Practical Subjects:',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        if (examData["practical_result"]["subjects"] != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var subject in examData["practical_result"]["subjects"])
                ListTile(
                  title: Text(
                    '${subject["name"]}: ${subject["status"]}',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  dense: true,
                  contentPadding: EdgeInsets.all(0),
                ),
            ],
          ),
      ],
    );
  }
}

 */
