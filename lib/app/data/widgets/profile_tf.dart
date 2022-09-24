import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../const/app_const/app_color.dart';

class ProfleTextfield extends StatelessWidget {
  final String hintText;
  const ProfleTextfield({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 48,
        width: 300,
        child: TextFormField(
          decoration: InputDecoration(
            fillColor: Color(0xffF3F3F3),
            filled: true,
            isDense: true,
            hintText: hintText,
            hintStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColor.hintText),
            focusColor: Colors.blue,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blue,
              ),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(5.r),
            ),
          ),
        ),
      ),
    );
  }
}
