import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:tech_fest_management/app/data/widgets/event_tiles.dart';

import '../controllers/event_list_screen_controller.dart';

class EventListScreenView extends GetView<EventListScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Events',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10, top: 12, bottom: 12).r,
            child: Container(
              height: 12.h,
              width: 84.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: Color(0xffD9D9D9),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xff3A3A3A),
                      size: 15,
                    ),
                    Text(
                      "All Events",
                      style: TextStyle(
                          color: Color(0xff3A3A3A),
                          fontWeight: FontWeight.w500),
                    ),
                  ]),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 14.w,
        ),
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(),
                ],
              );
            }),
      ),
    );
  }
}
