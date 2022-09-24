import 'package:get/get.dart';

import 'package:tech_fest_management/app/modules/home/bindings/home_binding.dart';
import 'package:tech_fest_management/app/modules/home/views/home_view.dart';
import 'package:tech_fest_management/app/modules/signin_screen/bindings/signin_screen_binding.dart';
import 'package:tech_fest_management/app/modules/signin_screen/views/signin_screen_view.dart';
import 'package:tech_fest_management/app/modules/signup_screen/bindings/signup_screen_binding.dart';
import 'package:tech_fest_management/app/modules/signup_screen/views/signup_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static String INITIAL = Routes.SIGNIN_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP_SCREEN,
      page: () => SignupScreenView(),
      binding: SignupScreenBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN_SCREEN,
      page: () => SigninScreenView(),
      binding: SigninScreenBinding(),
    ),
  ];
}
