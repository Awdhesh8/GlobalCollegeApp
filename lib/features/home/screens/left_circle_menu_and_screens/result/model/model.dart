class StudentModel {
  final List<Semester> semesters;
  final List<OverallStatus> overallStatus;

  StudentModel({
    required this.semesters,
    required this.overallStatus,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      semesters: List<Semester>.from(json['response']['semesters'].map((x) => Semester.fromJson(x))),
      overallStatus: List<OverallStatus>.from(json['response']['overallStatus'].map((x) => OverallStatus.fromJson(x))),
    );
  }
}

// class Semester {
//   final int semesterNumber;
//   final Exam finalExam;
//   final Exam midTermExam;
//
//   Semester({
//     required this.semesterNumber,
//     required this.finalExam,
//     required this.midTermExam,
//   });
//
//   factory Semester.fromJson(Map<String, dynamic> json) {
//     return Semester(
//       semesterNumber: json['semester_number']?? '',
//       finalExam: Exam.fromJson(json['final_exam'] ?? ''),
//       midTermExam: Exam.fromJson(json['mid_term_exam']?? ''),
//     );
//   }
// }

class Exam {
  final String result;
  final ExamResult theoreticalResult;
  final ExamResult practicalResult;
  final String sgpa;

  Exam({
    required this.result,
    required this.theoreticalResult,
    required this.practicalResult,
    required this.sgpa,
  });

  factory Exam.fromJson(Map<String, dynamic> json) {
    return Exam(
      result: json['result']?? '',
      sgpa: json['current_semester_sgpa']?? '',
      theoreticalResult: ExamResult.fromJson(json['theoretical_result']?? ''),
      practicalResult: ExamResult.fromJson(json['practical_result']?? ''),
    );
  }
}

class ExamResult {
  final String result;
  final List<Subject> subjects;
  final String sgpa;

  ExamResult({
    required this.result,
    required this.subjects, required this.sgpa,
  });

  factory ExamResult.fromJson(Map<String, dynamic> json) {
    return ExamResult(
      result: json['result']?? '',
      sgpa: json['current_semester_sgpa']?? '',
      subjects: List<Subject>.from(json['subjects'].map((x) => Subject.fromJson(x))),
    );
  }
}

class Subject {
  final String name;
  final String grade;
  final String status;

  Subject({
    required this.name,
    required this.grade,
    required this.status,
  });

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      name: json['name']?? '',
      grade: json['grade']?? '',
      status: json['status']?? '',
    );
  }
}

class Semester {
  final String semesterNumber;
  final Exam finalExam;

  Semester({
    required this.semesterNumber,
    required this.finalExam,
  });

  factory Semester.fromJson(Map<String, dynamic> json) {
    return Semester(
      semesterNumber: json['semesters']['semester_number'].toString(),
      finalExam: Exam.fromJson(json['semesters']['final_exam'] ?? {}),
    );
  }
}

class OverallStatus {
  final String currentSemester;
  final double currentSemesterCgpa;
  final String currentSemesterStatus;
  final String midTermStatus;
  final String finalStatus;

  OverallStatus({
    required this.currentSemester,
    required this.currentSemesterCgpa,
    required this.currentSemesterStatus,
    required this.midTermStatus,
    required this.finalStatus,
  });

  factory OverallStatus.fromJson(Map<String, dynamic> json) {
    return OverallStatus(
      currentSemester: json['current_semester'].toString(),
      currentSemesterCgpa: json['current_semester_cgpa'] != null ? double.tryParse(json['current_semester_cgpa'].toString()) ?? 0.0 : 0.0,
      currentSemesterStatus: json['current_semester_status'].toString(),
      midTermStatus: json['mid_term_status'].toString(),
      finalStatus: json['final_status'].toString(),
    );
  }
}







/*
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

 */