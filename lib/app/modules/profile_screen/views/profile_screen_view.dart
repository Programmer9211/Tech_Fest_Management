import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:tech_fest_management/app/data/widgets/custom_button.dart';
import 'package:tech_fest_management/app/data/widgets/profile_tf.dart';
import 'package:tech_fest_management/const/app_const/app_color.dart';

import '../controllers/profile_screen_controller.dart';

class ProfileScreenView extends GetView<ProfileScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8).r,
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        backgroundColor: AppColor.backGround,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 31).r,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 100.h,
                    width: 100.h,
                    decoration: BoxDecoration(
                      color: AppColor.blocks,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  SizedBox(
                    width: 26.w,
                  ),
                  GetBuilder<ProfileScreenController>(builder: (cont) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cont.userModel.name,
                          style: TextStyle(
                              fontSize: 22.sp, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          cont.userModel.email,
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          cont.userModel.instituteName,
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w500),
                        ),
                      ],
                    );
                  })
                ],
              ),
              SizedBox(
                height: 26.h,
              ),
              Container(
                height: 64.h,
                width: 347.w,
                decoration: BoxDecoration(
                  color: AppColor.blocks,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Events Attended:",
                      style: TextStyle(
                          fontSize: 22.sp, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "${controller.userModel.eventAttended}",
                      style: TextStyle(
                          fontSize: 32.sp, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 22.h,
              ),
              Container(
                height: 270.h,
                width: 300.w,
                decoration: BoxDecoration(
                  color: AppColor.blocks,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: GetBuilder<ProfileScreenController>(builder: (cont) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 26.h,
                      ),
                      ProfleTextfield(
                        hintText: "Name",
                        controller: controller.name,
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      ProfleTextfield(
                        hintText: "Phone Number",
                        controller: controller.phoneNumber,
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      ProfleTextfield(
                        hintText: "Institute Name",
                        controller: controller.instituteName,
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      ProfleTextfield(
                        hintText: "Registration Id",
                        controller: controller.registrationId,
                      ),
                    ],
                  );
                }),
              ),
              SizedBox(
                height: 10.h,
              ),
              KButton(
                title: "Save",
                onTap: () {
                  controller.onSaveData();
                },
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
