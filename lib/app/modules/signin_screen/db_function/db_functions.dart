import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tech_fest_management/app/models/user_model.dart';
import 'package:tech_fest_management/const/app_const/app_keys.dart';

import '../../../data/get_storage/get_storage.dart';

class SigninFunction {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<void> getData() async {
    final result = await _firestore
        .collection(AppKeys.users)
        .doc(_auth.currentUser!.uid)
        .get();

    UserModel userModel = UserModel.fromJson(result.data()!);

    print(userModel.toJson());

    await Storage.saveValue(AppKeys.uid, userModel.uid);
    await Storage.saveValue(AppKeys.email, userModel.email);
    await Storage.saveValue(AppKeys.name, userModel.name);
    await Storage.saveValue(AppKeys.profileImage, userModel.profileImage);
    await Storage.saveValue(
        AppKeys.isProfileComplete, userModel.isProfileComplete);
  }
}
