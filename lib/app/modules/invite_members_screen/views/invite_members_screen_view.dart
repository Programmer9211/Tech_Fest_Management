import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/invite_members_screen_controller.dart';

class InviteMembersScreenView extends GetView<InviteMembersScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InviteMembersScreenView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'InviteMembersScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
