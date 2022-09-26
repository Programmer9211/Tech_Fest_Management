import 'package:get/get.dart';

import '../modules/authentication/bindings/authentication_binding.dart';
import '../modules/authentication/views/authentication_view.dart';
import '../modules/event_details_screen/bindings/event_details_screen_binding.dart';
import '../modules/event_details_screen/views/event_details_screen_view.dart';
import '../modules/event_list_screen/bindings/event_list_screen_binding.dart';
import '../modules/event_list_screen/views/event_list_screen_view.dart';
import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/views/forgot_password_view.dart';
import '../modules/home/bindings/home_bindings.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/profile_screen/bindings/profile_screen_binding.dart';
import '../modules/profile_screen/views/profile_screen_view.dart';
import '../modules/register_event/bindings/register_event_binding.dart';
import '../modules/register_event/views/register_event_view.dart';
import '../modules/search_screen/bindings/search_screen_binding.dart';
import '../modules/search_screen/views/search_screen_view.dart';
import '../modules/signin_screen/bindings/signin_screen_binding.dart';
import '../modules/signin_screen/bindings/signin_screen_binding.dart';
import '../modules/signin_screen/views/signin_screen_view.dart';
import '../modules/signin_screen/views/signin_screen_view.dart';
import '../modules/signup_screen/bindings/signup_screen_binding.dart';
import '../modules/signup_screen/bindings/signup_screen_binding.dart';
import '../modules/signup_screen/views/signup_screen_view.dart';
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
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_SCREEN,
      page: () => SearchScreenView(),
      binding: SearchScreenBinding(),
    ),
  ];
}
