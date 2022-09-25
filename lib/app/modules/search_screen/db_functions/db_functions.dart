import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tech_fest_management/app/models/user_model.dart';
import 'package:tech_fest_management/const/app_const/app_keys.dart';

class SearchFunctions {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<UserModel?> searchUsersToInvite(String query) async {
    try {
      final result = await _firestore
          .collection(AppKeys.users)
          .where(AppKeys.registrationId, isEqualTo: query)
          .get();

      UserModel user = UserModel.fromJson(result.docs.first.data());

      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
