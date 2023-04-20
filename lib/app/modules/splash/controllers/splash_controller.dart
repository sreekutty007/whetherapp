import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:whetherapp/app/routes/app_pages.dart';

class SplashController extends GetxController {
  final scrollIndicator = 0.obs;
  final pageController = PageController();
  final data = GetStorage();

  navigation() {
    bool isLogin = data.read("isLogin") ?? false;

    if (isLogin) {
      Get.offAllNamed(Routes.home);
    } else {
      Get.offAllNamed(Routes.login);
    }
  }
}
