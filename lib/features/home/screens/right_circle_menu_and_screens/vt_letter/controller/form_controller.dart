import 'package:get/get.dart';

import '../widgets/vt_letter_form.dart';

class VTLetterFormController extends GetxController {
  RxString fromController = ''.obs;
  RxString toController = ''.obs;
  RxString subjectsController = ''.obs;//
  RxBool reasonError = false.obs;
  RxBool toError = false.obs;
  RxBool fromError = false.obs;

  Rx<VtLetterSubject?> subjectController = Rx<VtLetterSubject?>(null);
  RxBool subjectError = false.obs;

  RxString vtSubjectId = ''.obs;
  // RxList to store the history of leave applications
  RxList<String> vtLetterHistory = <String>[].obs;

}