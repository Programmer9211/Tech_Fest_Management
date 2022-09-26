import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tech_fest_management/const/app_const/app_keys.dart';

import '../../../models/event_model.dart';

class EventListFunctions {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<List<EventModel>?> getOrganiserEvents() async {
    try {
      final result = await _firestore.collection(AppKeys.events).get();

      List<EventModel> eventModel =
          result.docs.map((e) => EventModel.fromJson(e.data())).toList();

      return eventModel;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
