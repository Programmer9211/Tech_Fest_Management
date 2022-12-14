import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tech_fest_management/app/data/widgets/event_tiles.dart';
import 'package:tech_fest_management/app/routes/app_pages.dart';
import 'package:tech_fest_management/const/app_const/app_color.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.backGround,
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
          // IconButton(
          //   onPressed: () {
          //     controller.onChangeTheme();
          //   },
          //   icon: Icon(
          //     Icons.dark_mode,
          //     color: Colors.black,
          //   ),
          // ),
          SizedBox(
            width: 12.w,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
              onTap: () {
                Get.toNamed(Routes.PROFILE_SCREEN);
              },
              child: Container(
                height: 42.h,
                width: 28.w,
                decoration: BoxDecoration(
                    color: Color(0xff000000),
                    borderRadius: BorderRadius.all(Radius.circular(8.r))),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                height: 1.4,
                width: 13.w,
              ),
              Expanded(
                child: Container(height: 1.2.h, color: AppColor.black80),
              ),
              Container(
                height: 1.4,
                width: 130.w,
              )
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.sp),
            child: Column(
              children: [
                Container(
                  // color: Colors.red,
                  height: 230.h,
                  width: 430.w,
                  child: PageView.builder(
                    itemCount: controller.carouselSliderImage.length,
                    onPageChanged: controller.onPageChanged,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          // height: 300.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.r),
                            image: DecorationImage(
                              fit: BoxFit.fill,

                              // scale: 3.0,
                              image: AssetImage(
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
                  height: size.height / 30,
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
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        child: Container(
                          height: 1.h,
                          // width: 160.w,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 18.w),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.EVENT_LIST_SCREEN);
                        },
                        child: Text(
                          "More",
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.blue,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                GetBuilder<HomeController>(builder: (controller) {
                  if (controller.eventsModel != null) {
                    return EventTile(
                      model: controller.eventsModel,
                    );
                  } else {
                    return SizedBox();
                  }
                }),
                
              ],
            ),
          )
        ],
      ),
    );
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
