import 'package:flutter/material.dart';
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
  var selectedCompany = "0".obs;
  // RxList to store the history of leave applications
  RxList<String> vtLetterHistory = <String>[].obs;

  Rx<List<DropdownMenuItem<String>>> listCompanyDropDown = Rx<List<DropdownMenuItem<String>>>([]);

  void getCompany()async{
    // listCompanyDropDown.value.add(
    //   child:Text("data"),
    //   value : 10,
    // );
    print(vtSubjectId);
    listCompanyDropDown.value.add(DropdownMenuItem(child: Text("GCF"),value: '1998',));
    listCompanyDropDown.value.add(DropdownMenuItem(child: Text("TCS"),value: '1948',));
    //listCompanyDropDown.value.add(DropdownMenuItem(value: '0',child: Text(vtSubjectId.toString()),));
  }
}