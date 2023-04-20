import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:whetherapp/app/data/api/api_calls.dart';
import 'package:whetherapp/app/data/database/database.dart';
import 'package:whetherapp/app/data/database/user_dao.dart';
import 'package:whetherapp/app/data/models/whether_model.dart';
import 'package:whetherapp/app/routes/app_pages.dart';

class WhetherMapController extends GetxController {
  var whether = Whether().obs;
  final data = GetStorage();

  @override
  void onInit() {
    super.onInit();
    callApi();
  }

  callApi() async {
    var response = await ApiCalls().getWhether();
    whether.value = response;
  }

  logout() async {
    data.erase();
    await UserDatabase().removeAll();
    // Get.toNamed(Routes.login);
    Get.offAllNamed(Routes.login);
  }
}
