import 'package:dio/dio.dart';

class ApiInterceptor {
  final Dio dio = Dio();

  Dio getDioInstance() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // options.headers = _header;
          if (options.data != null) {}
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioError e, handler) {
          return handler.next(e);
        },
      ),
    );
    return dio;
  }
}
