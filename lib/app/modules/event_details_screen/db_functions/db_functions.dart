import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tech_fest_management/app/models/user_model.dart';
import 'package:tech_fest_management/const/app_const/app_keys.dart';

class EventDetailsFunctions {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<void> registerUserInApp(String id) async {
    try {
      final result = await _firestore
          .collection(AppKeys.users)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      UserModel userModel = UserModel.fromJson(result.data()!);

      await _firestore
          .collection(AppKeys.events)
          .doc(id)
          .collection(AppKeys.participants)
          .doc(userModel.uid)
          .set(userModel.toJson());

      _firestore.runTransaction((transaction) async {
        final eventRefrence = _firestore.collection(AppKeys.events).doc(id);

        final getEvent = await transaction.get(eventRefrence);

        int participantCount = getEvent.data()!['participants'];

        participantCount++;

        transaction.update(
          eventRefrence,
          {'participants': participantCount},
        );
      });
    } catch (e) {
      print(e);
    }
  }
}
