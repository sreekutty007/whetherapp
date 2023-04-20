import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/user_form/bindings/user_form_binding.dart';
import '../modules/user_form/views/user_form_view.dart';
import '../modules/whether_map/bindings/whether_map_binding.dart';
import '../modules/whether_map/views/whether_map_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.userForm,
      page: () => const UserFormView(),
      binding: UserFormBinding(),
    ),
    GetPage(
      name: _Paths.whetherMap,
      page: () => const WhetherMapView(),
      binding: WhetherMapBinding(),
    ),
  ];
}
