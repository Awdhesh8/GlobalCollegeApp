
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../data/api/api_services.dart';
import '../widgets/vt_letter_form.dart';

class VTLetterFormController extends GetxController {
  Repository repository = Repository();
  RxString fromController = ''.obs;
  RxString toController = ''.obs;
  RxString subjectsController = ''.obs;//
  RxBool reasonError = false.obs;
  RxBool toError = false.obs;
  RxBool fromError = false.obs;

  Rx<VtLetterSubject?> subjectController = Rx<VtLetterSubject?>(null);
  //Rx<VtlocationModal?> locationController = Rx<VtlocationModal?>(null);
  //Rx<List<StateDatum>> lststatemodel = Rx<List<StateDatum>>([]);
  RxBool subjectError = false.obs;

  RxString vtSubjectId = ''.obs;
  var selectedCompany = "0".obs;
  var selectedCompanyww = "0".obs;
  // RxList to store the history of leave applications
  RxList<String> vtLetterHistory = <String>[].obs;

  Rx<List<DropdownMenuItem<String>>> listCompanyDropDown = Rx<List<DropdownMenuItem<String>>>([]);
  //Rx<List<ValueItem<String>>> companyValueItem = Rx<List<ValueItem<String>>>([]);
  Rx<List<DistDatum>> lstdistmodel = Rx<List<DistDatum>>([]);

  final items = <Item>[
    // Item(1, 'Item 1'),
    // Item(2, 'Item 2'),
    // Item(3, 'Item 3'),
    // Item(4, 'Item 4'),
    // Item(5, 'Item 5'),
  ].obs;


  void getCompany111()async{
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

    Future<void> getCompany() async {
      String vtp_subjid = vtSubjectId.value;
      print('yyy $vtp_subjid');
      //ApiService apiProvider = ApiService();
      var snapshot = await Future.value(ApiService.fetchVtLetterLocation111(vtp_subjid));
      var data = snapshot['response'];
      print(data);

      // for(var item as data){
      //   var id = item['vtp_id'];
      //   var name = item['locat'];
      // }
   /*
    try {
      // Get.dialog(Center(
      //   child: CircularProgressIndicator(),
      // ));
      repository!.getalldistrict()?.then((value) {
        print('fff');
        print(value);
        if (value.data.isNotEmpty) {
          //Get.back();
           lstdistmodel.value.clear();
          lstdistmodel.value.addAll(value.data);
          listCompanyDropDown.value = [];
          listCompanyDropDown.value.add(
            DropdownMenuItem(
              child: Text(
                'Select Dist',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              value: "0",
            ),
          );
          for (DistDatum dist in lstdistmodel.value) {
            listCompanyDropDown.value.add(
              DropdownMenuItem(
                child: Text(
                  dist.districtTitle,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                value: dist.districtid,
              ),
            );
          }
        }

      }).onError((error, stackTrace) {
        Get.back();
        print('popo $error');
        //error handling code
      });
    } catch (exception) {
      //Get.back();
      print('ggggg $exception');
      // exception handling code
    }

    */
  }


}
class Item {
  final int id;
  final String name;
  Item(this.id, this.name);
}

class Repository {
 // final ApiService apiProvider;
  ApiService apiProvider = ApiService();
  // Repository(this.apiProvider);
  Future<VtlocationModal>? getalldistrict() => apiProvider.fetchVtLetterLocation();

}

