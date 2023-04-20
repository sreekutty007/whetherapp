import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:whetherapp/app/routes/app_pages.dart';

class LoginController extends GetxController {
  var obscureText = true.obs;
  var emailFieldController = TextEditingController();
  var passwordFieldController = TextEditingController();
  final data = GetStorage();

  validate() {
    if (emailFieldController.text == "") {
      errorSnackBar('Please enter Username');
    } else if (passwordFieldController.text == "") {
      errorSnackBar('Please enter Password');
    } else if (emailFieldController.text != "thoughtbox@google.com" ||
        passwordFieldController.text != "Test@123456") {
      errorSnackBar('Incorrect Username or password');
    } else {
      Get.offAllNamed(Routes.home);
      data.write("isLogin", true);
    }
  }

  errorSnackBar(String error) {
    return Get.snackbar(
      "Error",
      error,
      backgroundColor: Colors.purple,
      colorText: Colors.white,
    );
  }
}
