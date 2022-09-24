import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  if (FirebaseAuth.instance.currentUser != null) {
    AppPages.INITIAL = Routes.HOME;
  } else {
    AppPages.INITIAL = Routes.SIGNIN_SCREEN;
  }

  runApp(
    ScreenUtilInit(builder: (context, widget) {
      return GetMaterialApp(
        title: "Application",
        debugShowCheckedModeBanner: false,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      );
    }),
  );
}
