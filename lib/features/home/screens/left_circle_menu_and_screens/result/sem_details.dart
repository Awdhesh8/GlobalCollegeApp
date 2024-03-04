
import 'package:flutter/material.dart';
import 'model/model.dart';

class SemesterDetail extends StatelessWidget {
  final String? semester;
  final bool? isUniversityTab;
  final List<Subject>? universitySubjects;
  final List<Subject>? midtermSubjects;
  final List<Subject>? practicalSubjects;

  const SemesterDetail({
    Key? key,
    this.semester,
    this.isUniversityTab,
    this.universitySubjects,
    this.midtermSubjects,
    this.practicalSubjects,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(semester!),
          bottom: TabBar(
            tabs: [
              Tab(text: isUniversityTab! ? 'University' : 'Mid Term'),
              const Tab(text: 'Practical'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // University Marks or Midterm Marks
            Center(
              child: Column(
                children: [
                  // Display subjects
                  if (isUniversityTab! && universitySubjects != null)
                    ...(universitySubjects ?? [])
                        .map((subject) =>
                        Text('${subject.name}: ${subject.marks}'))
                        .toList(),
                  if (!isUniversityTab! && midtermSubjects != null)
                    ...(midtermSubjects ?? [])
                        .map((subject) =>
                        Text('${subject.name}: ${subject.marks}'))
                        .toList(),
                ],
              ),
            ),
            // Practical Marks
            Center(
              child: Column(
                children: practicalSubjects != null
                    ? practicalSubjects!
                    .map((subject) =>
                    Text('${subject.name}: ${subject.marks}'))
                    .toList()
                    : [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
