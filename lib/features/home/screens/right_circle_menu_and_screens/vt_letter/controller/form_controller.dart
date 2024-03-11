import 'package:get/get.dart';

class VTLetterFormController extends GetxController {
  RxString fromController = ''.obs;
  RxString toController = ''.obs;
  RxString subjectsController = ''.obs;//
  RxBool reasonError = false.obs;
  RxBool toError = false.obs;
  RxBool fromError = false.obs;

  // RxList to store the history of leave applications
  RxList<String> vtLetterHistory = <String>[].obs;


}