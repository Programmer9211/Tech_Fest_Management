import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tech_fest_management/app/data/indictor.dart';
import 'package:tech_fest_management/app/models/user_model.dart';
import 'package:tech_fest_management/app/modules/profile_screen/db_functions/db_functions.dart';

class ProfileScreenController extends GetxController {
  TextEditingController name = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController instituteName = TextEditingController();
  final TextEditingController registrationId = TextEditingController();
  final TextEditingController courseName = TextEditingController();
  final TextEditingController github = TextEditingController();

  final TextEditingController linkdin = TextEditingController();

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
    phoneNumber.text = userModel.phoneNumber;
    instituteName.text = userModel.instituteName;
    registrationId.text = userModel.registrationId;

    update();
  }

  void onSaveData() async {
    if (name.text.isNotEmpty &&
        phoneNumber.text.isNotEmpty &&
        instituteName.text.isNotEmpty &&
        registrationId.text.isNotEmpty) {
      Indicator.showLoading();

      userModel.name = name.text;
      userModel.phoneNumber = phoneNumber.text;
      userModel.instituteName = instituteName.text;
      userModel.registrationId = registrationId.text;
      userModel.githubProfile = github.text;
      userModel.linkdinProfile = linkdin.text;
      userModel.courseName = courseName.text;

      await ProfileFunctions.setUserProfileDetails(userModel);

      Indicator.closeLoading();

      // Get.back();
      update();
    }
  }

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
      phoneNumber: "",
      instituteName: "",
      profileImage: "",
      registrationId: "",
      eventAttended: 0,
      isProfileComplete: false,
      courseName: "",
      githubProfile: "",
      linkdinProfile: "",
    );
  }
}
