import 'package:get/get.dart';
import 'package:tech_fest_management/app/models/user_model.dart';
import 'package:tech_fest_management/app/modules/profile_screen/db_functions/db_functions.dart';

class ProfileScreenController extends GetxController {
  late UserModel userModel;

  void getUserDetails() async {
    UserModel? model = await ProfileFunctions.getUserProfileDetail();

    if (model != null) {
      userModel = model;
    }
  }
}
