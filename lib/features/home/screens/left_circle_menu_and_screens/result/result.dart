import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/texts/top_first_heading.dart';
import '../../../../../utils/constants/colors.dart';

class AcademicResult {
  final String semester;
  final double marks;

  AcademicResult({required this.semester, required this.marks});
}

class SubjectResult {
  final String subject;
  final double marks;

  SubjectResult({required this.subject, required this.marks});
}

class ResultController extends GetxController {
  RxList<AcademicResult> results = <AcademicResult>[
    AcademicResult(semester: 'Semester 1', marks: 85.5),
    AcademicResult(semester: 'Semester 2', marks: 78.0),
    AcademicResult(semester: 'Semester 3', marks: 92.5),
    AcademicResult(semester: 'Semester 4', marks: 92.5),
    AcademicResult(semester: 'Semester 5', marks: 92.5),

    // Add more semesters as needed
  ].obs;

  // Dummy subject-wise results for each semester
  Map<String, List<SubjectResult>> subjectResults = {
    'Semester 1': [
      SubjectResult(subject: 'Math', marks: 90),
      SubjectResult(subject: 'Physics', marks: 85),
      SubjectResult(subject: 'Chemistry', marks: 92),
    ],
    'Semester 2': [
      SubjectResult(subject: 'Computer Science', marks: 88),
      SubjectResult(subject: 'English', marks: 78),
      SubjectResult(subject: 'History', marks: 95),
    ],
    'Semester 3': [
      SubjectResult(subject: 'Economics', marks: 94),
      SubjectResult(subject: 'Biology', marks: 89),
      SubjectResult(subject: 'Geography', marks: 91),
    ],
     'Semester 4': [
      SubjectResult(subject: 'Economics', marks: 94),
      SubjectResult(subject: 'Biology', marks: 89),
      SubjectResult(subject: 'Geography', marks: 91),
    ],
     'Semester 5': [
      SubjectResult(subject: 'Economics', marks: 94),
      SubjectResult(subject: 'Biology', marks: 89),
      SubjectResult(subject: 'Geography', marks: 91),
    ],

    // Add more subjects and semesters as needed
  };
}

class Result extends StatelessWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context) {
    final ResultController resultController = Get.put(ResultController());

    return Scaffold(
      backgroundColor: EColors.backgroundColor,

      /// App Bar
      appBar: GAppBar(
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
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Overall Status Card
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TopHeading(
                      fontSize: 26,
                      text: 'Overall Performance',
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Marks: ${resultController.results.map((result) => result.marks).reduce((a, b) => a + b)}',
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

              /// Semester-wise Results
              Obx(
                () => GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                  ),
                  itemCount: resultController.results.length,
                  itemBuilder: (context, index) {
                    final result = resultController.results[index];
                    return GestureDetector(
                      onTap: () {
                        // Navigate to a detailed view for the selected semester
                        Get.to(() => SemesterDetail(
                              semester: result.semester,
                              subjectResults: resultController
                                      .subjectResults[result.semester] ??
                                  [],
                            ));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              result.semester,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Marks: ${result.marks}',
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

class SemesterDetail extends StatelessWidget {
  final String semester;
  final List<SubjectResult> subjectResults;

  const SemesterDetail({
    Key? key,
    required this.semester,
    required this.subjectResults,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(semester),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Subjects:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: subjectResults
                    .map((subject) => Text(
                          '${subject.subject}: ${subject.marks}',
                          style: TextStyle(fontSize: 16.0),
                        ))
                    .toList(),
              ),
            ],
          ),
        ));
  }
}
