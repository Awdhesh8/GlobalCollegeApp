import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../model/model.dart';

class ResultController extends GetxController {
  RxList<AcademicResult> results = <AcademicResult>[
    AcademicResult(
      semester: 'Semester 1',
      universitySubjects: [
        Subject(name: 'Mathematics', marks: 90.0),
        Subject(name: 'Physics', marks: 80.0),
        // Add more subjects as needed
      ],
      midtermSubjects: [
        Subject(name: 'Computer Science', marks: 85.0),
        Subject(name: 'Chemistry', marks: 75.5),
        // Add more subjects as needed
      ],
      practicalSubjects: [
        Subject(name: 'Lab Work', marks: 95.0),
        Subject(name: 'Project', marks: 90.0),
        // Add more subjects as needed
      ],
    ),
    AcademicResult(
      semester: 'Semester 2',
      universitySubjects: [
        Subject(name: 'Biology', marks: 85.0),
        Subject(name: 'History', marks: 90.5),
        Subject(name: 'Biology', marks: 85.0),
        Subject(name: 'History', marks: 90.5),

        // Add more subjects as needed
      ],
      midtermSubjects: [
        Subject(name: 'English Literature', marks: 87.0),
        Subject(name: 'Geography', marks: 82.5),
        Subject(name: 'English Literature', marks: 87.0),
        Subject(name: 'Geography', marks: 82.5),

        // Add more subjects as needed
      ],
      practicalSubjects: [
        Subject(name: 'Practical Exam 1', marks: 92.0),
        Subject(name: 'Practical Exam 2', marks: 90.5),
        Subject(name: 'Practical Exam 3', marks: 92.0),
        Subject(name: 'Practical Exam 4', marks: 90.5),

        // Add more subjects as needed
      ],
    ),
    AcademicResult(
      semester: 'Semester 3',
      universitySubjects: [
        Subject(name: 'Mathematics', marks: 90.0),
        Subject(name: 'Physics', marks: 80.0),
        // Add more subjects as needed
      ],
      midtermSubjects: [
        Subject(name: 'Computer Science', marks: 85.0),
        Subject(name: 'Chemistry', marks: 75.5),
        // Add more subjects as needed
      ],
      practicalSubjects: [
        Subject(name: 'Lab Work', marks: 95.0),
        Subject(name: 'Project', marks: 90.0),
        // Add more subjects as needed
      ],
    ),
    AcademicResult(
      semester: 'Semester 4',
      universitySubjects: [
        Subject(name: 'Biology', marks: 44.0),
        Subject(name: 'History', marks: 44.5),
        Subject(name: 'Biology', marks: 44.0),
        Subject(name: 'History', marks: 44.5),

        // Add more subjects as needed
      ],
      midtermSubjects: [
        Subject(name: 'English Literature', marks: 47.0),
        Subject(name: 'Geography', marks: 42.5),
        Subject(name: 'English Literature', marks: 47.0),
        Subject(name: 'Geography', marks: 42.5),
        Subject(name: 'English Literature', marks: 47.0),
        Subject(name: 'Geography', marks: 42.5),
        Subject(name: 'English Literature', marks: 47.0),
        Subject(name: 'Geography', marks: 42.5),
        Subject(name: 'Geography', marks: 42.5),
        Subject(name: 'English Literature', marks: 47.0),
        Subject(name: 'Geography', marks: 42.5),
        Subject(name: 'English Literature', marks: 47.0),
        Subject(name: 'Geography', marks: 42.5),

        // Add more subjects as needed
      ],
      practicalSubjects: [
        Subject(name: 'Practical Exam 11', marks: 40.0),
        Subject(name: 'Practical Exam 22', marks: 40.5),
        Subject(name: 'Practical Exam 33', marks: 40.0),
        Subject(name: 'Practical Exam 44', marks: 40.5),

        // Add more subjects as needed
      ],
    ),
    // Add more semesters as needed
  ].obs;
}

