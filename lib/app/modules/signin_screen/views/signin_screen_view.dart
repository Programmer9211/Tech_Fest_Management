import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signin_screen_controller.dart';

class SigninScreenView extends GetView<SigninScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SigninScreenView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SigninScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
