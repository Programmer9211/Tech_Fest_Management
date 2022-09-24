import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tech_fest_management/app/data/authentication/authentication.dart';
import 'package:tech_fest_management/app/data/indictor.dart';
import 'package:tech_fest_management/app/routes/app_pages.dart';

class SigninScreenController extends GetxController {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  void onSign() async {
    if (email.text.isNotEmpty && password.text.isNotEmpty) {
      Indicator.showLoading();
      await AuthenticationService().userLogin(email.text, password.text);
      Indicator.closeLoading();
      Get.offAllNamed(Routes.AUTHENTICATION);
    }
  }
}
