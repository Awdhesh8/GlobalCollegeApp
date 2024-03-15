import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_dropdown/models/value_item.dart';

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
  var selectedCompanyww = "0".obs;
  // RxList to store the history of leave applications
  RxList<String> vtLetterHistory = <String>[].obs;

  Rx<List<DropdownMenuItem<String>>> listCompanyDropDown = Rx<List<DropdownMenuItem<String>>>([]);
  Rx<List<ValueItem<String>>> companyValueItem = Rx<List<ValueItem<String>>>([]);

  void getCompany()async{
    listCompanyDropDown.value.clear();
    print(vtSubjectId);
    listCompanyDropDown.value.add(DropdownMenuItem(child: Text("GCF"),value: '1998',));
    listCompanyDropDown.value.add(DropdownMenuItem(child: Text("TCS"),value: '1948',));
    print(vtSubjectId);

    companyValueItem.value.add(const ValueItem(label: 'label', value: '33'));
    //listCompanyDropDown.value.add(DropdownMenuItem(value: '0',child: Text(vtSubjectId.toString()),));
  }
}