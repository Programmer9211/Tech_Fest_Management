import 'package:get/get.dart';

import 'package:tech_fest_management/app/modules/authentication/bindings/authentication_binding.dart';
import 'package:tech_fest_management/app/modules/authentication/views/authentication_view.dart';
import 'package:tech_fest_management/app/modules/event_list_screen/bindings/event_list_screen_binding.dart';
import 'package:tech_fest_management/app/modules/event_list_screen/views/event_list_screen_view.dart';

import '../modules/event_details_screen/bindings/event_details_screen_binding.dart';
import '../modules/event_details_screen/views/event_details_screen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/profile_screen/bindings/profile_screen_binding.dart';
import '../modules/profile_screen/views/profile_screen_view.dart';
import '../modules/signin_screen/bindings/signin_screen_binding.dart';
import '../modules/signin_screen/views/signin_screen_view.dart';
import '../modules/signup_screen/bindings/signup_screen_binding.dart';
import '../modules/signup_screen/views/signup_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static String INITIAL = Routes.AUTHENTICATION;

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
      name: _Paths.AUTHENTICATION,
      page: () => AuthenticationView(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN_SCREEN,
      page: () => SigninScreenView(),
      binding: SigninScreenBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_SCREEN,
      page: () => ProfileScreenView(),
      binding: ProfileScreenBinding(),
    ),
    GetPage(
      name: _Paths.EVENT_DETAILS_SCREEN,
      page: () => EventDetailsScreenView(),
      binding: EventDetailsScreenBinding(),
    ),
    GetPage(
      name: _Paths.EVENT_LIST_SCREEN,
      page: () => EventListScreenView(),
      binding: EventListScreenBinding(),
    ),
  ];
}
