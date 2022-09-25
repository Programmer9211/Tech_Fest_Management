import 'package:get/get.dart';

import '../controllers/invite_members_screen_controller.dart';

class InviteMembersScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InviteMembersScreenController>(
      () => InviteMembersScreenController(),
    );
  }
}
