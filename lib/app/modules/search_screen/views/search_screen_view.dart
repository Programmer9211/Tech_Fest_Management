import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:tech_fest_management/app/data/widgets/custom_textfield.dart';
import 'package:tech_fest_management/const/app_const/app_color.dart';

import '../controllers/search_screen_controller.dart';

class SearchScreenView extends GetView<SearchScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0.0,
          backgroundColor: Color(0xffFAFAFA),
          title: Text(
            "Search",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xff000000),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0.w),
          child: Column(
            children: [
              TextFormField(
                controller: controller.searchController,
                cursorColor: Colors.blue,
                maxLines: 1,
                onChanged: (value) {
                  controller.onSearch(value);
                },
                decoration: InputDecoration(
                  fillColor: Color(0xffF3F3F3),
                  filled: true,
                  isDense: true,
                  hintText: "Enter Institution Id",
                  hintStyle: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColor.hintText),
                  focusColor: Colors.blue,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              GetBuilder<SearchScreenController>(builder: (controller) {
                if (controller.model.name.isNotEmpty) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Color(0xffd6d6d6),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 48.h,
                            width: 48.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: Colors.black,
                            ),
                            child: controller.model.profileImage.isNotEmpty
                                ? Image.network(controller.model.profileImage)
                                : SizedBox(),
                          ),
                          SizedBox(
                            width: 14.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.model.name,
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: "ubuntu",
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Text(
                                controller.model.registrationId,
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontFamily: "ubuntu",
                                    color: Colors.black87),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 60.w,
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.onInvite();
                            },
                            child: Container(
                              height: 36.h,
                              width: 80.h,
                              alignment: Alignment.center,
                              child: Text(
                                "Invite",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: "ubuntu",
                                    color: Colors.white),
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xff000000),
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                } else {
                  return SizedBox();
                }
              })
            ],
          ),
        ));
  }
}
