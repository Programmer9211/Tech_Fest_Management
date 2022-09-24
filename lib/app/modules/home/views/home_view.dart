import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:overlay_group_avatar/overlay_group_avatar.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xffFAFAFA),
          title: Text(
            "Tech Fest",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xff000000),
            ),
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
        body: Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            child: Column(
              children: [
                SizedBox(
                  height: 120.h,
                  width: 300.w,
                  child: PageView.builder(
                    itemCount: controller.carouselSliderImage.length,
                    onPageChanged: controller.onPageChanged,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                controller.carouselSliderImage[index],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: size.height / 25,
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < controller.isSelected.length; i++)
                        Obx(() {
                          return indicator(
                              size, controller.isSelected[i].value);
                        })
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: Column(
              children: [
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
                      SizedBox(width: 18.w),
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
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Row(
                      children: [
                        Container(
                            height: 98.h,
                            width: 98.h,
                            //child : Image.asset(""),
                            decoration: BoxDecoration(
                                color: Color(0xff000000),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.r)))),
                        SizedBox(width: 16.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Event_Name",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                    fontFamily: 'ubuntu',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: 18.w),
                                Text(
                                  "22 Oct 2022",
                                  style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 14.sp,
                                    fontFamily: 'ubuntu',
                                    // fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "Slogan description goes here",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'ubuntu',
                              ),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // SizedBox(width: 20.w),
                                      for (int i = 0;
                                          i < controller.peoples.length;
                                          i++)
                                        Container(
                                          margin:
                                              EdgeInsets.symmetric(vertical: 0),
                                          child: Align(
                                            widthFactor: 0.5,
                                            child: CircleAvatar(
                                              radius: 16.r,
                                              backgroundColor: Colors.white,
                                              child: CircleAvatar(
                                                radius: 14.r,
                                                backgroundColor: Colors.black38,
                                                //backgroundImage: Image.asset(),
                                              ),
                                            ),
                                          ),
                                        )
                                    ],
                                  ),
                                ),
                                SizedBox(width: 72.w),
                                Container(
                                  width: 80.w,
                                  height: 32.h,
                                  alignment: Alignment.center,
                                  child: Text("Register",
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "ubuntu")),
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(4.r))),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xffD6d6d6),
                      borderRadius: BorderRadius.all(Radius.circular(8.r))),
                )
              ],
            ),
          )
        ]));
  }

  Widget indicator(Size size, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        height: isSelected ? size.height / 80 : size.height / 100,
        width: isSelected ? size.height / 80 : size.height / 100,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black,
        ),
      ),
    );
  }
}

Widget indicator(Size size, bool isSelected) {
  return Padding(
    padding: const EdgeInsets.all(2.0),
    child: Container(
      height: isSelected ? size.height / 80 : size.height / 100,
      width: isSelected ? size.height / 80 : size.height / 100,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black,
      ),
    ),
  );
}
