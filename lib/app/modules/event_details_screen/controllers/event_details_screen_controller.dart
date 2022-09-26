import 'package:get/get.dart';
import 'package:tech_fest_management/app/models/event_model.dart';

class EventDetailsScreenController extends GetxController {
  late EventModel eventModel;
  List<String> carouselSliderImage = [];
  List<RxBool> isSelected = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    eventModel = EventModel.fromJson(Get.arguments);
  }

  void onPageChanged(int value) {}
}
