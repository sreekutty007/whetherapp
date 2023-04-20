import 'package:whetherapp/app/data/api/api_interceptor.dart';
import 'package:whetherapp/app/data/models/whether_model.dart';

class ApiCalls extends ApiInterceptor {
  final String url = "https://api.weatherapi.com/v1/current.json?key=0b8c80e84ac547ad800101902231804&q=48.8567,2.3508";

  Future<Whether> getWhether() async {
    try {
      
      final response =
          await getDioInstance().get(url);
      // print(response);
      return Whether.fromJson(response.data);
    } catch (e) {
      throw e.toString();
    }
  }
}
