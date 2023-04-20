import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/whether_map_controller.dart';

class WhetherMapView extends GetView<WhetherMapController> {
  const WhetherMapView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WhetherMapController());
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SingleChildScrollView(
        child: _body(),
      ),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          _header(),
          SizedBox(
            height: 80,
          ),
          _temp(),
          SizedBox(
            height: 80,
          ),
          _otherDetails()
        ],
      ),
    );
  }

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        Obx(() {
          return Text(
            controller.whether.value.location?.region.toString() ?? "",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w400,
            ),
          );
        }),
        GestureDetector(
          onTap: () {
            controller.logout();
          },
          child: const Text(
            "Logout",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  Widget _temp() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              return Text(
                controller.whether.value.current?.tempC.toString() ?? "",
                style: const TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              );
            }),
            const Text(
              "\u2103",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              return Text(
                controller.whether.value.current?.tempF.toString() ?? "",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              );
            }),
            const Text(
              "\u2109",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Obx(() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              controller.whether.value.current?.condition?.icon == null
                  ? Container()
                  : Image.network(
                      "https:${controller.whether.value.current?.condition?.icon}",
                      height: 40,
                    ),
              Text(
                controller.whether.value.current?.condition!.text.toString() ??
                    "",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ],
          );
        }),
      ],
    );
  }

  Widget _otherDetails() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12.0,
        right: 50,
      ),
      child: Obx(() {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Humidity :",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Text(
                  controller.whether.value.current?.humidity.toString() ?? "",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Wind Speed(mph) :",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Text(
                  controller.whether.value.current?.windMph.toString() ?? "",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Wind Speed(kph) :",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Text(
                  controller.whether.value.current?.windKph.toString() ?? "",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Wind Direction :",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Text(
                  controller.whether.value.current?.windDir.toString() ?? "",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
