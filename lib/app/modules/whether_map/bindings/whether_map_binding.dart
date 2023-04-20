import 'package:get/get.dart';

import '../controllers/whether_map_controller.dart';

class WhetherMapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WhetherMapController>(
      () => WhetherMapController(),
    );
  }
}
