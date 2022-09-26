import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tech_fest_management/app/data/indictor.dart';
import 'package:tech_fest_management/app/models/user_model.dart';
import 'package:tech_fest_management/const/app_const/app_keys.dart';

import '../../../data/generate_id.dart';

class ProfileFunctions {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final FirebaseStorage _storage = FirebaseStorage.instance;
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

  static Future<void> setUserProfileDetails(UserModel userModel) async {
    try {
      await _firestore
          .collection(AppKeys.users)
          .doc(_auth.currentUser!.uid)
          .update(userModel.toJson());
    } catch (e) {
      print(e);
    }
  }

  static Future<String?> uploadImage(File imageFile) async {
    try {
      final ref = _storage.ref().child("Images").child("${generateId()}.jpg");
      var uploadTask = await ref.putFile(imageFile);

      return await uploadTask.ref.getDownloadURL();
    } catch (e) {
      Indicator.showSnackBar("Something went wrong");
      print(e);
      return null;
    }
  }
}
