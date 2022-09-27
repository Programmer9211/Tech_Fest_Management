import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tech_fest_management/app/data/indictor.dart';
import 'package:tech_fest_management/app/models/user_model.dart';
import 'package:tech_fest_management/app/modules/profile_screen/db_functions/db_functions.dart';

import '../../../../const/const.dart';
import '../../../data/get_storage/get_storage.dart';

class ProfileScreenController extends GetxController {
  TextEditingController name = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController instituteName = TextEditingController();
  final TextEditingController registrationId = TextEditingController();
  final TextEditingController courseName = TextEditingController();
  final TextEditingController github = TextEditingController();
  final TextEditingController linkdin = TextEditingController();

  void checkIfProfileCompleted() {
    if (name.text.isNotEmpty &&
        phoneNumber.text.isNotEmpty &&
        instituteName.text.isNotEmpty &&
        registrationId.text.isNotEmpty &&
        courseName.text.isNotEmpty &&
        github.text.isNotEmpty &&
        linkdin.text.isNotEmpty) {
      userModel.isProfileComplete = true;
      Storage.saveValue(AppKeys.isProfileComplete, true);
    }
  }

  File? profileImageFile;

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
      checkIfProfileCompleted();
      await Storage.saveValue(AppKeys.name, userModel.name);

      if (profileImageFile != null) {
        String imageUrl =
            await ProfileFunctions.uploadImage(profileImageFile!) ?? "";
        userModel.profileImage = imageUrl;
        await Storage.saveValue(AppKeys.profileImage, userModel.profileImage);
      }

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

  void pickImage() async {
    await ImagePicker.platform
        .pickImage(source: ImageSource.gallery)
        .then((value) {
      if (value != null) {
        profileImageFile = File(value.path);
        update();
      }
    });
  }
}
