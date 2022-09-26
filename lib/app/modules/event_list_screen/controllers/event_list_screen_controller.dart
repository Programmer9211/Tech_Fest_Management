import 'package:get/get.dart';
import 'package:tech_fest_management/app/data/indictor.dart';
import 'package:tech_fest_management/app/models/event_model.dart';
import 'package:tech_fest_management/app/modules/event_list_screen/db_functions/db_functions.dart';

class EventListScreenController extends GetxController {
  List<EventModel> eventModelList = [];

  @override
  void onReady() {
    super.onReady();
    getAllEvents();
  }

  void getAllEvents() async {
    Indicator.showLoading();

    List<EventModel>? model = await EventListFunctions.getOrganiserEvents();

    if (model != null) {
      eventModelList = model;
      update();
    }

    Indicator.closeLoading();
  }
}
