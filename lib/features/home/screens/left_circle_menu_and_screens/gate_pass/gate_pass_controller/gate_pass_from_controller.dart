
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/gate_pass_form_widget/gate_pass_form.dart';

class GatePassFormController extends GetxController {
  RxString fromTimeController = ''.obs;
  RxString toTimeController = ''.obs;
  //RxString reasonController = ''.obs;

  Rx<GatePassReason?> reasonController = Rx<GatePassReason?>(null);
  RxString goWithController = ''.obs;

  RxBool reasonError = false.obs;
  RxBool toError = false.obs;
  RxBool fromError = false.obs;

  // RxList to store the history of leave applications
  RxList<String> gatePassHistory = <String>[].obs;


}
