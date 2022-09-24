import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KButton extends StatelessWidget {
  final String title;
  final Function onTap;

  const KButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap(),
      child: Container(
        height: 64.h,
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18.sp,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          color: Colors.black,
          boxShadow: const [
            BoxShadow(
              offset: Offset(4, 4),
              blurRadius: 8,
              color: Colors.black26,
            )
          ],
        ),
      ),
    );
  }
}
