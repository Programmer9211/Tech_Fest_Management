import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:tech_fest_management/app/routes/app_pages.dart';
import 'package:tech_fest_management/const/app_const/app_color.dart';

import '../../home/views/home_view.dart';
import '../controllers/event_details_screen_controller.dart';

class EventDetailsScreenView extends GetView<EventDetailsScreenController> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 8.0.w),
          child: Icon(
            Icons.arrow_back_ios,
            size: 20.sp,
            color: Colors.black,
          ),
        ),
        titleSpacing: 1,
        leadingWidth: 50,
        elevation: 0.0,
        backgroundColor: AppColor.backGround,
        title: Text(
          controller.eventModel.eventTitle,
          style: TextStyle(
            fontSize: 18.sp,
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontFamily: "ubuntu",
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8.h),
              SizedBox(
                height: 120.h,
                width: 340.w,
                child: PageView.builder(
                  itemCount: controller.eventModel.eventImages.length,
                  onPageChanged: controller.onPageChanged,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          image: DecorationImage(
                            image: NetworkImage(
                              controller.eventModel.eventImages[index],
                            ),
                            fit: BoxFit.cover,
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
                        return indicator(size, controller.isSelected[i].value);
                      })
                  ],
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                controller.eventModel.eventTitle,
                style: TextStyle(
                    fontSize: 22.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontFamily: "ubuntu"),
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                controller.eventModel.eventTitle,
                style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontFamily: "ubuntu"),
              ),
              SizedBox(
                height: 12.h,
              ),
              IContainer(
                title: "Description",
                desc: controller.eventModel.eventDescription,
                isClickable: false,
              ),
              SizedBox(
                height: 12.h,
              ),
              IContainer(
                  title: "Venue",
                  desc: controller.eventModel.eventLocation.address,
                  isClickable: true,
                  onTap: () {
                    controller.navigateToGoogleMap();
                  },
                  clickText: "Show in Map"),
              SizedBox(
                height: 12.h,
              ),
              IContainer(
                title: "Entry Fees",
                desc: controller.eventModel.registrationFees == 0
                    ? "Free"
                    : controller.eventModel.registrationFees.toString(),
                isClickable: false,
              ),
              SizedBox(
                height: 12.h,
              ),
              IContainer(
                title: "Timings",
                desc:
                    "Start at ${controller.eventModel.eventStartTimings.time} ${controller.eventModel.eventStartTimings.day}-${controller.eventModel.eventStartTimings.month}-${controller.eventModel.eventStartTimings.year} \nEnds at ${controller.eventModel.eventEndTimings.time} ${controller.eventModel.eventEndTimings.day}-${controller.eventModel.eventEndTimings.month}-${controller.eventModel.eventEndTimings.year}",
                isClickable: true,
                clickText: "Set Reminder",
              ),
              SizedBox(
                height: 12.h,
              ),
              IContainer(
                title: "Contact Details",
                desc:
                    controller.eventModel.eventContactDetails.convertToString(),
                isClickable: false,
              ),
              SizedBox(height: 80.h),
            ],
          ),
        ),
      ),
      bottomSheet: InkWell(
        onTap: () {
          controller.onFillForm();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 400.w,
            height: 60.h,
            alignment: Alignment.center,
            child:
                GetBuilder<EventDetailsScreenController>(builder: (controller) {
              return Text(
                controller.isAlreadyExist ? "Already Registered" : "Fill Form",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontFamily: "ubuntu",
                ),
              );
            }),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(
                Radius.circular(8.r),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget IContainer(
    {required String title,
    required String desc,
    required bool isClickable,
    String clickText = "",
    onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 400.w,
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                isClickable
                    ? InkWell(
                        onTap: () {},
                        child: Text(
                          clickText,
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue,
                          ),
                        ),
                      )
                    : SizedBox(),
              ],
            ),
            SizedBox(height: 4.h),
            Text(
              desc,
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
          color: AppColor.tileColor,
          borderRadius: BorderRadius.all(Radius.circular(8.r))),
    ),
  );
}
