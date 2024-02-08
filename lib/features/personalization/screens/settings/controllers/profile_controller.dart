import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxString imagePath = ''.obs;
  RxString contactNumber = ''.obs;
  RxString email = ''.obs;
  RxString selectedBloodGroup = ''.obs;
  RxString samaraId = ''.obs;
  RxBool hasLaptop = false.obs;
  RxString laptopBrand = ''.obs;
  RxString laptopRam = ''.obs;
  RxString laptopProcessor = ''.obs;
  RxString laptopConfig = ''.obs;

  void toggleLaptop(bool value) {
    hasLaptop.value = value;

    // Reset laptop details when the user toggles the laptop
    if (!value) {
      laptopBrand.value = '';
      laptopRam.value = '';
      laptopProcessor.value = '';
      laptopConfig.value = '';
    }
  }
}
