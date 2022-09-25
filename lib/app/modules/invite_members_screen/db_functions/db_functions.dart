import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tech_fest_management/app/models/user_model.dart';
import 'package:tech_fest_management/const/app_const/app_keys.dart';

class InviteMembersFunctions {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<List<UserModel>?> getAllInvitesOfCurrentUser() async {
    try {
      final result = await _firestore
          .collection(AppKeys.users)
          .doc(_auth.currentUser!.uid)
          .collection(AppKeys.invites)
          .get();

      List<UserModel> userModelList = [];

      for (var element in result.docs) {
        final model = await _firestore
            .collection(AppKeys.users)
            .doc(element.data()[AppKeys.uid])
            .get();

        if (model.exists) {
          userModelList.add(UserModel.fromJson(model.data()!));
        }
      }

      return userModelList;
    } catch (e) {
      print(e);

      return null;
    }
  }
}
