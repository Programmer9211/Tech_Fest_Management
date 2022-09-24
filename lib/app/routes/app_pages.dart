import 'package:get/get.dart';

<<<<<<< HEAD
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/profile_screen/bindings/profile_screen_binding.dart';
import '../modules/profile_screen/views/profile_screen_view.dart';
import '../modules/signin_screen/bindings/signin_screen_binding.dart';
import '../modules/signin_screen/views/signin_screen_view.dart';
import '../modules/signup_screen/bindings/signup_screen_binding.dart';
import '../modules/signup_screen/views/signup_screen_view.dart';
=======
import 'package:tech_fest_management/app/modules/authentication/bindings/authentication_binding.dart';
import 'package:tech_fest_management/app/modules/authentication/views/authentication_view.dart';
import 'package:tech_fest_management/app/modules/home/bindings/home_binding.dart';
import 'package:tech_fest_management/app/modules/home/views/home_view.dart';
import 'package:tech_fest_management/app/modules/signin_screen/bindings/signin_screen_binding.dart';
import 'package:tech_fest_management/app/modules/signin_screen/views/signin_screen_view.dart';
import 'package:tech_fest_management/app/modules/signup_screen/bindings/signup_screen_binding.dart';
import 'package:tech_fest_management/app/modules/signup_screen/views/signup_screen_view.dart';
>>>>>>> 7716a9cbbcdfc1f81cae4afb96baa80407108734

part 'app_routes.dart';

class AppPages {
  AppPages._();

<<<<<<< HEAD
  static String INITIAL = Routes.PROFILE_SCREEN;
=======
  static String INITIAL = Routes.AUTHENTICATION;
>>>>>>> 7716a9cbbcdfc1f81cae4afb96baa80407108734

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
    GetPage(
<<<<<<< HEAD
      name: _Paths.PROFILE_SCREEN,
      page: () => ProfileScreenView(),
      binding: ProfileScreenBinding(),
=======
      name: _Paths.AUTHENTICATION,
      page: () => AuthenticationView(),
      binding: AuthenticationBinding(),
>>>>>>> 7716a9cbbcdfc1f81cae4afb96baa80407108734
    ),
  ];
}
