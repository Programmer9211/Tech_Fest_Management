import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tech_fest_management/app/models/event_model.dart';
import 'package:tech_fest_management/app/modules/home/controllers/home_controller.dart';

import '../../routes/app_pages.dart';

class EventTile extends StatelessWidget {
  final EventModel? model;
  EventTile({super.key, required this.model});

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.EVENT_DETAILS_SCREEN, arguments: model!.toJson());
      },
      child: Container(
        height: 120.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w).r,
          child: Row(
            children: [
              Container(
                height: 98.h,
                width: 98.h,
                //child : Image.asset(""),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                      image: NetworkImage(model!.eventImages.first)),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.r),
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            model!.eventTitle,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontFamily: 'ubuntu',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(width: 18.w),
                        Text(
                          "${model!.eventStartTimings.day} ${model!.eventStartTimings.month} ${model!.eventStartTimings.year}",
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 12.sp,
                            fontFamily: 'ubuntu',
                            // fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      model!.eventDescription,
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
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // SizedBox(
                          //   width: 50.w,
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // SizedBox(width: 20.w),
                              for (int i = 0;
                                  i < controller.peoples.length;
                                  i++)
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 0),
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
                          // SizedBox(width: 52.w),
                          InkWell(
                            onTap: () {
                              Get.toNamed(Routes.EVENT_DETAILS_SCREEN);
                            },
                            child: Container(
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
                                  Radius.circular(4.r),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
            color: Color(0xffD6d6d6),
            borderRadius: BorderRadius.all(Radius.circular(8.r))),
      ),
    );
  }
}
