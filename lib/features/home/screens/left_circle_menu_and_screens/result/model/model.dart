import '../result.dart';

class AcademicResult {
  final String semester;
  final List<Subject> universitySubjects;
  final List<Subject> midtermSubjects;
  final List<Subject> practicalSubjects;

  AcademicResult({
    required this.semester,
    List<Subject>? universitySubjects,
    List<Subject>? midtermSubjects,
    List<Subject>? practicalSubjects,
  })  : universitySubjects = universitySubjects ?? [],
        midtermSubjects = midtermSubjects ?? [],
        practicalSubjects = practicalSubjects ?? [];
}

class Subject {
  final String name;
  final double marks;

  Subject({required this.name, required this.marks});
}