import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tech_fest_management/app/models/user_model.dart';
import 'package:tech_fest_management/const/app_const/app_keys.dart';

class ProfileFunctions {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<UserModel?> getUserProfileDetail() async {
    try {
      final result = await _firestore
          .collection(AppKeys.users)
          .doc(_auth.currentUser!.uid)
          .get();

      UserModel model = UserModel.fromJson(result.data()!);

      return model;
    } catch (e) {
      print(e);

      return null;
    }
  }

  static Future<void> setUserProfileDetails() async {}
}
