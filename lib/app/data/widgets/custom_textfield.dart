import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class KTextField extends StatelessWidget {
  final String hintText;
  const KTextField({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.blue,
      maxLines: 1,
      decoration: InputDecoration(
        fillColor: Color(0xffF3F3F3),
        filled: true,
        isDense: true,
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
        focusColor: Colors.blue,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(5.r),
        ),
      ),
    );
  }
}
