import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tech_fest_management/app/models/user_model.dart';
import 'package:tech_fest_management/app/modules/search_screen/db_functions/db_functions.dart';

class SearchScreenController extends GetxController {
  late UserModel model;

  final TextEditingController searchController = TextEditingController();

  void onSearch(String query) async {
    await SearchFunctions.searchUsersToInvite(query);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    model = UserModel(
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
