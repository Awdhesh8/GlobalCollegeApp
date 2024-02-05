import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  RxBool isLoggedIn = false.obs;

  void login() async {
    isLoggedIn.value = true;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', true);
  }

  void logout() async {
    // Clear user session
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);

    // Update isLoggedIn status
    isLoggedIn.value = false;
  }


  bool checkLogin() {
    return isLoggedIn.value;
  }
}
