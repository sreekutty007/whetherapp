import 'package:get/get.dart';
import 'package:whetherapp/app/data/api/api_calls.dart';
import 'package:whetherapp/app/data/database/user_dao.dart';
import 'package:whetherapp/app/data/database/user_db_model.dart';
import 'package:whetherapp/app/data/models/whether_model.dart';

class HomeController extends GetxController {
  var userList = <UserDBModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    callData();
    callApi();
  }

  callData() async {
    var response = await UserDAO.fetchAll();
    userList.value = response;
  }

  deleteData(String id) async {
    await UserDAO.deleteRow(id);
    await callData();
  }

  updateActive(String id, String active) async {
    await UserDAO.updateActive(id, active);
    await callData();
  }

  callApi() async {
    var response = await ApiCalls().getWhether();
  }
}
