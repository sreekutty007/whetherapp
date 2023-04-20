import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:whetherapp/app/data/database/user_dao.dart';

class UserFormController extends GetxController {
  var firstNameFieldController = TextEditingController();
  var lastNameFieldController = TextEditingController();
  var emailFieldController = TextEditingController();
  var data = GetStorage();

  validate() {
    if (firstNameFieldController.text == "") {
      errorSnackBar('Please enter First Name');
    } else if (lastNameFieldController.text == "") {
      errorSnackBar('Please enter Last Name');
    } else if (emailFieldController.text == "") {
      errorSnackBar('Please enter Email');
    } else {
      addDataToDB();
    }
  }

  addDataToDB() async {
    try {
      int id = data.read("Id") ?? 0;
      await UserDAO.saveToDB(
        "#$id",
        firstNameFieldController.text,
        lastNameFieldController.text,
        emailFieldController.text,
      );
      data.write("Id", id + 1);
      Get.back();
    } on Exception catch (e) {
      // ignore: avoid_print
      print(e);
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
