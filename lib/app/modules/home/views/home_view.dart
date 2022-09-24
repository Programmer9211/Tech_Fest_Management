import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xffFAFAFA),
          title: Text(
            "Tech Fest",
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff000000)),
          ),
          actions: [
            Icon(
              Icons.dark_mode,
              color: Colors.black,
            ),
            SizedBox(
              width: 12.w,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 42.h,
                width: 28.w,
                decoration: BoxDecoration(
                    color: Color(0xff000000),
                    borderRadius: BorderRadius.all(Radius.circular(8.r))),
              ),
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child:
                    Container(height: 120.h, width: 300.w, color: Colors.grey),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Coming Events",
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      height: 1.h,
                      width: 160.w,
                      color: Colors.black,
                    ),
                    Text(
                      "More",
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Container(
                height: 120.h,
                decoration: BoxDecoration(
                  color: Color(0xffD9D9D9),
                ),
              )
            ],
          ),
        ));
  }
}
