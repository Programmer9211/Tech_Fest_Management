import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tech_fest_management/app/data/authentication/authentication.dart';
import 'package:tech_fest_management/app/data/indictor.dart';
import 'package:tech_fest_management/app/routes/app_pages.dart';

class SignupScreenController extends GetxController {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController name = TextEditingController();
//836841
  final isChecked = false;
  void onSignup() async {
    if (email.text.isNotEmpty &&
        password.text.isNotEmpty &&
        name.text.isNotEmpty) {
      Indicator.showLoading();
      await AuthenticationService().userRegistration(
        email.text,
        password.text,
        name.text,
      );

      Indicator.closeLoading();

      Get.offAllNamed(Routes.AUTHENTICATION);
    }
  }
}
