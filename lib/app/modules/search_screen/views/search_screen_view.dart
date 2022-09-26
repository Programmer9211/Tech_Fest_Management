import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:tech_fest_management/app/data/widgets/custom_textfield.dart';

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
        padding:  EdgeInsets.symmetric(horizontal:12.0.w),
        child: Column(
          children: [
            KTextField(hintText: "Enter Institution ID", controller: controller.searchController),

            SizedBox(height: 20.h,),
            Container(
              decoration: BoxDecoration(
                color: Color(0xffd6d6d6),
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:8.0, vertical: 8.0),
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
                        ),
                    SizedBox(width: 14.w,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Participant Name",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: "ubuntu",
                            fontWeight: FontWeight.w500,
                            color: Colors.black
                          ),
                        ),
                        SizedBox(height: 4.h,),
                        Text(
                              "Registration ID",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontFamily: "ubuntu",
                                  color: Colors.black87),
                            )
                      ],
                    ),
                    SizedBox(width: 60.w,),
                    Container(
                      height: 48.h,
                      width: 100.h,
                      alignment: Alignment.center,
                      child: Text(
                            "Invite",
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: "ubuntu",
                                
                                color: Colors.white),
                          ) ,
                      decoration: BoxDecoration(
                            color: Color(0xff000000),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                    )
                  ],
                ),
              )
            )
          ],
        ),
      )
    );
  }
}
