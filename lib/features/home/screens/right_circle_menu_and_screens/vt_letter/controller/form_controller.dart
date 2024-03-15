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
  var selectedCompanyww = "0".obs;
  // RxList to store the history of leave applications
  RxList<String> vtLetterHistory = <String>[].obs;

  Rx<List<DropdownMenuItem<String>>> listCompanyDropDown = Rx<List<DropdownMenuItem<String>>>([]);
  //Rx<List<ValueItem<String>>> companyValueItem = Rx<List<ValueItem<String>>>([]);

  final items = <Item>[
    // Item(1, 'Item 1'),
    // Item(2, 'Item 2'),
    // Item(3, 'Item 3'),
    // Item(4, 'Item 4'),
    // Item(5, 'Item 5'),
  ].obs;


  void getCompany()async{
    listCompanyDropDown.value.clear();
    print(vtSubjectId);
    listCompanyDropDown.value.add(DropdownMenuItem(child: Text("GCF"),value: '1998',));
    listCompanyDropDown.value.add(DropdownMenuItem(child: Text("TCS"),value: '1948',));
    items.add(Item(11, "Item 11"));
    items.add(Item(22, "Item 22"));
    print(vtSubjectId);

    //companyValueItem.value.add(const ValueItem(label: 'label', value: '33'));
    //listCompanyDropDown.value.add(DropdownMenuItem(value: '0',child: Text(vtSubjectId.toString()),));
  }


  final selectedItems = <Item>[].obs;

  void toggleSelection(Item item) {
    if (selectedItems.contains(item)) {
      selectedItems.remove(item);
    } else {
      selectedItems.add(item);
    }
    print('Selected Items: ${selectedItems.map((item) => item.name).join(", ")}');
    print('Selected Items: ${selectedItems.map((item) => item.id).join(", ")}');
  }
}
class Item {
  final int id;
  final String name;
  Item(this.id, this.name);
}