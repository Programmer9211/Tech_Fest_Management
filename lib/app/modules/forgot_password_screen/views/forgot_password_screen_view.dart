import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/forgot_password_screen_controller.dart';

class ForgotPasswordScreenView extends GetView<ForgotPasswordScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ForgotPasswordScreenView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ForgotPasswordScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
