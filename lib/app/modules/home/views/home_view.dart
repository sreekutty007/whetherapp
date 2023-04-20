import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:whetherapp/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      // backgroundColor: Colors.white70,
      body: Column(
        children: [
          _appBar(),
          const SizedBox(
            height: 10,
          ),
          _userList(),
        ],
      ),
    );
  }

  Widget _appBar() {
    return Container(
      width: Get.width,
      height: 80,
      color: Colors.purple,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 20),
            child: GestureDetector(
              onTap: () {
                Get.toNamed(Routes.userForm)?.then((value) {
                  controller.callData();
                });
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _userList() {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: controller.userList.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) => controller.deleteData(
                controller.userList[index].id.toString(),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.whetherMap);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: 1, color: Colors.black12)),
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${controller.userList[index].firstName} ${controller.userList[index].lastName}",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${controller.userList[index].email}",
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              controller.userList[index].active == "true"
                                  ? Text(
                                      "Current whether: ${controller.userList[index].whether}\u2103",
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                          toggleButton(index),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }

  Widget toggleButton(int index) {
    return Obx(() {
      return Switch(
        value: controller.userList[index].active == 'true' ? true : false,
        onChanged: (bool value) {
          print(value);
          controller.updateActive(
            controller.userList[index].id.toString(),
            value.toString(),
          );
        },
        activeColor: Colors.purple,
        inactiveTrackColor: Colors.grey,
        inactiveThumbColor: Colors.grey,
      );
    });
  }
}
