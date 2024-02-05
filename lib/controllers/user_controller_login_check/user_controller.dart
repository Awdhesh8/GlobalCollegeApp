import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  RxBool isLoggedIn = false.obs;

  Future<void> init() async {
    // Initialize user status from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoggedIn.value = prefs.getBool('isLoggedIn') ?? false;
  }

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
