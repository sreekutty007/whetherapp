import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:whetherapp/app/routes/app_pages.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          buildPageView(),
          buildDotIndicator(),
        ],
      ),
    );
  }

  PageView buildPageView() {
    return PageView(
      clipBehavior: Clip.antiAlias,
      onPageChanged: (value) {
        controller.scrollIndicator.value = value;
      },
      controller: controller.pageController,
      scrollDirection: Axis.horizontal,
      pageSnapping: true,
      children: <Widget>[
        sliderOneView(),
        sliderTwoView()
      ],
    );
  }

  Padding buildDotIndicator() {
    return Padding(
      padding: EdgeInsets.only(top: Get.height * 0.9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              2,
              (index) => Obx(
                () => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: AnimatedContainer(
                    curve: Curves.easeIn,
                    duration: const Duration(milliseconds: 500),
                    width: index == controller.scrollIndicator.value ? 10 : 7,
                    height: index == controller.scrollIndicator.value ? 10 : 7,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget sliderOneView() {
    return const Center(
      child: Text(
        "Welcome",
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: Colors.purple
        ),
      ),
    );
  }

  Widget sliderTwoView() {
    return Center(
      child: _loginButton(),
    );
  }

  Widget _loginButton() {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: SizedBox(
        height: 46,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            controller.navigation();
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
