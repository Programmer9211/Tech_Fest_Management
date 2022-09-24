import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/event_list_screen_controller.dart';

class EventListScreenView extends GetView<EventListScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EventListScreenView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'EventListScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
