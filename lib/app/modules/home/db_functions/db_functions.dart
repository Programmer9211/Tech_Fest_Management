import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tech_fest_management/app/models/event_model.dart';
import 'package:tech_fest_management/const/app_const/app_keys.dart';

class HomeDbFunctions {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<List<String>?> getSliderData() async {
    try {
      final result =
          await _firestore.collection(AppKeys.carouselSliderCollection).get();

      List<String> carouselImageList = [];

      carouselImageList =
          result.docs.map((e) => e.data()['img'].toString()).toList();

      return carouselImageList;
    } catch (e) {
      print("Error: $e");

      return null;
    }
  }

  static Future<List<EventModel>?> getAllEvents() async {
    try {
      final result = await _firestore.collection(AppKeys.events).get();

      List<EventModel> model = [];

      model = result.docs.map((e) => EventModel.fromJson(e.data())).toList();

      return model;
    } catch (e) {
      print(e);

      return null;
    }
  }
}
