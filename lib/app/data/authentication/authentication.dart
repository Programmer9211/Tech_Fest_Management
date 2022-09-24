import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../const/app_const/app_alert.dart';
import '../../../const/app_const/app_keys.dart';
import '../../../const/app_const/firebase_exception.dart';
import '../../models/user_model.dart';
import '../../modules/signup_screen/db_functions/db_functions.dart';
import '../../routes/app_pages.dart';
import '../get_storage/get_storage.dart';

class AuthenticationService {
  AuthenticationService._privateConstructor();

  static final AuthenticationService _instance =
      AuthenticationService._privateConstructor();

  factory AuthenticationService() => _instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get uid => _auth.currentUser!.uid;

  Future<String> userLogin(String email, String password) async {
    try {
      final user = (await _auth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;

      if (user != null) {
        await Storage.saveValue(AppKeys.uid, uid);
        return AppKeys.sucess;
      } else {
        return AppKeys.failed;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseExceptions.userNotFound) {
        print(AppAlerts.noUser);
        return AppAlerts.noUser;
      } else if (e.code == FirebaseExceptions.wrongPassword) {
        print(AppAlerts.wrongPassword);
        return AppAlerts.weakPassword;
      } else {
        return AppKeys.failed;
      }
    }
  }

  Future<String> userRegistration(
      String email, String password, String name) async {
    try {
      final user = (await _auth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;

      if (user != null) {
        UserModel userModel = UserModel(
          email: email,
          uid: user.uid,
          name: name,
          phoneNumber: "",
          instituteName: "",
          profileImage: "",
          registrationId: "",
          eventAttended: 0,
          isProfileComplete: false,
        );

        await SignupFunctions.saveUserDetails(userModel);

        return AppKeys.sucess;
      } else {
        return AppKeys.failed;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseExceptions.weakPassword) {
        print(AppAlerts.weakPassword);
        return AppAlerts.weakPassword;
      } else if (e.code == FirebaseExceptions.emailInUse) {
        print(AppAlerts.accountExists);
        return AppAlerts.accountExists;
      } else {
        return AppKeys.failed;
      }
    }
  }

  Future<void> logOut() async {
    await Storage.clearStorage();
    await _auth.signOut().then((value) {
      Get.offAllNamed(Routes.SIGNIN_SCREEN);
    });
  }
}
