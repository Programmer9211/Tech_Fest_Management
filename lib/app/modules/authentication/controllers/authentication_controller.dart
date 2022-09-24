import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tech_fest_management/app/routes/app_pages.dart';

class AuthenticationController extends GetxController {
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    if (FirebaseAuth.instance.currentUser != null) {
      Get.offAllNamed(
        Routes.SIGNIN_SCREEN,
      );
    } else {
      Get.offAllNamed(
        Routes.SIGNUP_SCREEN,
      );
    }
  }
}
