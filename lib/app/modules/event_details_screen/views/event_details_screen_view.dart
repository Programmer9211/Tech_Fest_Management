import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:tech_fest_management/const/app_const/app_color.dart';

import '../controllers/event_details_screen_controller.dart';

class EventDetailsScreenView extends GetView<EventDetailsScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
          size: 20.sp,
          color: Colors.black,
        ),
        elevation: 0.0,
        backgroundColor: AppColor.backGround,
        title: Text(
          "Event_Name",
          style: TextStyle(
              fontSize: 18.sp,
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontFamily: "ubuntu"),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal:8.0),
        child: Column(
          children: [
            Container(
              width: 400.w,
              height: 100.h,
              color: Colors.black,
            )
          ],
        ),
      )
    );
  }
}
