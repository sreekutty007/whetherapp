import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: _body(),
      ),
    );
  }

  Widget _body() {
    return Container(
      padding: const EdgeInsets.all(20),
      height: Get.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Login",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _emailFiled(),
          const SizedBox(
            height: 20,
          ),
          _passwordFiled(),
          const SizedBox(
            height: 50,
          ),
          _loginButton(),
        ],
      ),
    );
  }

  Widget _emailFiled() {
    return TextField(
      controller: controller.emailFieldController,
      style: const TextStyle(
        fontSize: 20,
        color: Colors.black,
      ),
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.only(left: 20, right: 20, top: 11),
        counterText: "",
        hintText: "User Name",
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1.5,
          ),
        ),
        prefixIcon: Icon(
          Icons.person,
          size: 30,
          color: Colors.black,
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      onChanged: (String value) {},
    );
  }

  Widget _passwordFiled() {
    return Obx(() {
      return TextField(
        controller: controller.passwordFieldController,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
        obscureText: controller.obscureText.value,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 20, right: 20, top: 11),
          counterText: "",
          hintText: "Password",
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              width: 1.5,
            ),
          ),
          prefixIcon: const Icon(
            Icons.lock,
            size: 30,
            color: Colors.black,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              controller.obscureText.value = !controller.obscureText.value;
            },
            icon: controller.obscureText.value
                ? Image.asset("assets/icons/hide.png",
                    width: 30, color: Colors.grey)
                : const Icon(
                    Icons.remove_red_eye_outlined,
                    size: 30,
                    color: Colors.grey,
                  ),
          ),
        ),
        onChanged: (String value) {},
      );
    });
  }

  Widget _loginButton() {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: SizedBox(
        height: 46,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            controller.validate();
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
