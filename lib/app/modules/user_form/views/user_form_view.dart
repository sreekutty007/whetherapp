import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/user_form_controller.dart';

class UserFormView extends GetView<UserFormController> {
  const UserFormView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        height: Get.height,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            _firstNameFiled(),
            const SizedBox(
              height: 20,
            ),
            _lastNameFiled(),
            const SizedBox(
              height: 20,
            ),
            _emailFiled(),
            const SizedBox(
              height: 100,
            ),
            Row(
              children: [
                Expanded(child: _cancelButton()),
                Expanded(child: _saveButton()),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _firstNameFiled() {
    return TextField(
      controller: controller.firstNameFieldController,
      style: const TextStyle(
        fontSize: 20,
        color: Colors.black,
      ),
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.only(left: 12, right: 20, top: 11),
        counterText: "",
        hintText: "First Name",
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1.5,
          ),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      onChanged: (String value) {},
    );
  }

  Widget _lastNameFiled() {
    return TextField(
      controller: controller.lastNameFieldController,
      style: const TextStyle(
        fontSize: 20,
        color: Colors.black,
      ),
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.only(left: 12, right: 20, top: 11),
        counterText: "",
        hintText: "Last Name",
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1.5,
          ),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      onChanged: (String value) {},
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
        contentPadding: EdgeInsets.only(left: 12, right: 20, top: 11),
        counterText: "",
        hintText: "Email",
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1.5,
          ),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      onChanged: (String value) {},
    );
  }

  Widget _saveButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                  "Save",
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

  Widget _cancelButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 46,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            Get.back();
          },
          child: Container(
            decoration: BoxDecoration(
              // color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(width: 1.5,color: Colors.purple)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  "Cancel",
                  style: TextStyle(
                    color: Colors.purple,
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
