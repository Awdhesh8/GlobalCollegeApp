import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalcollegeapp/features/home/screens/left_circle_menu_and_screens/result/widget/exam_result.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../utils/constants/colors.dart';
import 'controller/controller.dart';
import 'model/model.dart';

class Result extends StatelessWidget {
  final StudentController studentController = Get.put(StudentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EColors.backgroundColor,
      appBar: const GAppBar(
        backgroundColor: Colors.transparent,
        showBackArrow: true,
        title: Text(
          'Your Results',
          style: TextStyle(
            fontSize: 24.0,
            fontFamily: 'Inter',
            color: EColors.textColorPrimary1,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Obx(
              () {
                final List<OverallStatus> overallStatusList =
                    studentController.studentModel.value.overallStatus;

                OverallStatus overallStatus = OverallStatus(
                  currentSemester: '',
                  currentSemesterCgpa: 0,
                  currentSemesterStatus: '',
                  midTermStatus: '',
                  finalStatus: '',
                );

                if (overallStatusList.isNotEmpty) {
                  overallStatus = overallStatusList.first;
                }

                return Container(
                  padding: const EdgeInsets.all(20.0),
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Current Semester: ${overallStatus.currentSemester}',
                        style: const TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10.0),
                      Text('SGPA: ${overallStatus.currentSemesterCgpa}'),
                      const SizedBox(height: 10.0),
                      Text(
                          'Current Semester Status: ${overallStatus.currentSemesterStatus}'),
                      const SizedBox(height: 10.0),
                      Text('Mid Term Status: ${overallStatus.midTermStatus}'),
                      const SizedBox(height: 10.0),
                      Text('Final Status: ${overallStatus.finalStatus}'),
                    ],
                  ),
                );
              },
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Semesters',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
            Obx(
              () {
                final List<Semester> semesters =
                    studentController.studentModel.value.semesters;

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .98,
                  ),
                  itemCount: semesters.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Navigate to the semester result screen passing the semester data
                        // Get.to(() => SemesterResultScreen(semester: semesters[index]));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10.0),
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Semester ${semesters[index].semesterNumber}',
                              style: const TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10.0),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          // Navigate to the final exam result screen passing the final exam data
                                          Get.to(
                                            () => ExamResultScreen(
                                              exam: semesters[index].finalExam,
                                              semester: semesters[index],
                                              examType: 'Final Exam',
                                              sgpa: 'fdff',
                                            ),
                                          );
                                        },
                                        child: const Text(
                                          'Final',
                                          style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize: 12),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          // Navigate to the mid term exam result screen passing the mid term exam data
                                          Get.to(() => ExamResultScreen(
                                                exam: semesters[index]
                                                    .midTermExam,
                                                semester: semesters[index],
                                                examType: 'Mid Term Exam',
                                                sgpa: '',
                                              ));
                                        },
                                        child: const Text(
                                          'Mid Sem',
                                          style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize: 12),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// https://jsonlint.com

///
// class ExamResultScreen extends StatelessWidget {
//   final Exam exam;
//   final Semester semester;
//   final String examType;
//
//   ExamResultScreen({required this.exam, required this.semester, required this.examType});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: GAppBar(
//         title: Text(examType),
//         showBackArrow: true,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Semester ${semester.semesterNumber} Results'),
//             Text('Result: ${exam.result}'),
//             Text('Theoretical Result: ${exam.theoreticalResult.result}'),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: exam.theoreticalResult.subjects.map((subject) {
//                 return Text('${subject.name}: ${subject.grade}');
//               }).toList(),
//             ),
//             Text('Practical Result: ${exam.practicalResult.result}'),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: exam.practicalResult.subjects.map((subject) {
//                 return Text('${subject.name}: ${subject.status}');
//               }).toList(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

///
/*
// class SemesterResultScreen extends StatelessWidget {
//   final Semester semester;
//
//   SemesterResultScreen({required this.semester});
//
//   @override
//   Widget build(BuildContext context) {
//     // Implement your UI to display semester results using the 'semester' object
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Semester ${semester.semesterNumber} Results'),
//       ),
//       body: Center(
//         child: Text('Semester ${semester.semesterNumber} Results'),
//       ),
//     );
//   }
// }
 */

/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalcollegeapp/features/home/screens/left_circle_menu_and_screens/result/widget/animation.dart';
import 'package:globalcollegeapp/features/home/screens/left_circle_menu_and_screens/result/widget/sem_container.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/continue_border_Deco_rectangle/continue_border_rectangle.dart';
import '../../../../../common/widgets/texts/top_first_heading.dart';
import '../../../../../utils/constants/colors.dart';
import 'controller/controller.dart';

class Result extends StatelessWidget {
  const Result({Key? key});

  @override
  Widget build(BuildContext context) {
    final ResultController resultController = Get.put(ResultController());
    final CustomAnimationController animationController =
        Get.put(CustomAnimationController());

    return Scaffold(
      backgroundColor: EColors.backgroundColor,

      /// App Bar
      appBar: const GAppBar(
        backgroundColor: Colors.transparent,
        showBackArrow: true,
        title: Text(
          'Your Results',
          style: TextStyle(
            fontSize: 24.0,
            fontFamily: 'Inter',
            color: EColors.textColorPrimary1,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      /// Body
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Overall Status Card
              CustomAnimation(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: CustomDeco.decoRectangle(),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TopHeading(
                        fontSize: 26,
                        text: 'Overall Performance',
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                              fontSize: 16,
                              color: EColors.textColorPrimary1,
                            ),
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              /// Semester-wise Results
              Obx(
                () => GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 170,
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                  ),
                  itemCount: resultController.results.length,
                  itemBuilder: (context, index) {
                    final result = resultController.results[index];
                    return CustomAnimation(
                      child: SemContainer(result: result),
                    );
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
 */
