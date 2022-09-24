import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tech_fest_management/app/data/indictor.dart';
import 'package:tech_fest_management/app/models/user_model.dart';
import 'package:tech_fest_management/app/modules/profile_screen/db_functions/db_functions.dart';

class ProfileScreenController extends GetxController {
  TextEditingController name = TextEditingController();
  final TextEditingController instituteId = TextEditingController();
  final TextEditingController instituteName = TextEditingController();
  final TextEditingController registrationId = TextEditingController();

  late UserModel userModel;

  void getUserDetails() async {
    Indicator.showLoading();

    UserModel? model = await ProfileFunctions.getUserProfileDetail();

    if (model != null) {
      userModel = model;
    }

    print(userModel.toJson());

    Indicator.closeLoading();

    name = TextEditingController(text: userModel.name);
    instituteId.text = userModel.institueId;
    instituteName.text = userModel.instituteName;
    registrationId.text = userModel.registrationId;

    update();
  }

  void onSaveData() async {}

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getUserDetails();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    userModel = UserModel(
      email: "",
      uid: "",
      name: "",
      institueId: "",
      instituteName: "",
      profileImage: "",
      registrationId: "",
      eventAttended: 0,
      isProfileComplete: false,
    );
  }
}
