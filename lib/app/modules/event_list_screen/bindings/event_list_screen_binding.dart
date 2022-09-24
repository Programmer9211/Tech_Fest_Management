import 'package:get/get.dart';

import '../controllers/event_list_screen_controller.dart';

class EventListScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventListScreenController>(
      () => EventListScreenController(),
    );
  }
}
