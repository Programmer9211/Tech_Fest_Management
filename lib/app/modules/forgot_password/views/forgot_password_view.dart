import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tech_fest_management/app/data/widgets/custom_button.dart';
import 'package:tech_fest_management/app/data/widgets/custom_textfield.dart';
import '../controllers/forgot_password_controller.dart';



class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60.h),
            Text(
              "FORGOT",
              style: TextStyle(
                fontSize: 52.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Password",
              style: TextStyle(
                height: 0.5,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20.h),
            SizedBox(height: 200.h, child: Image.asset("assets/forget.png")),
            SizedBox(height: 20.h),
            Text(
              "Enter your registered Email ID",
              style: TextStyle(
                height: 0.5,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 12.h),
            KTextField(
                hintText: "Enter Your Email",
                controller: controller.forgetController),
                SizedBox(height: 20.h),
            KButton(title: "Send Link", onTap: (){}),

            SizedBox(height: 22.h,),
            Text(
              "Note: Click on the link sent on your email...",
              style: TextStyle(
                fontSize: 14.sp,
                // fontWeight: FontWeight.w500,
                color: Color(0xff898989)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
